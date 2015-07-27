fs = require 'fs-plus'

{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
notifications = require '../notifications'
LoadingView = require '../views/loading-view'
dialog = require "../dialog"


module.exports =
  class HelperDumpIndexData extends BaseCommand

    isEnabled: ->
      return true

    dump: (client, index, {scroll}={}) ->
      fileName = dialog.saveDialog()
      if fileName is undefined
        return # canceled

      lodingView = new LoadingView()
      success = 0

      lodingView.updateMessage(
        "Dump Index Data #{index} ... #{success} docs.")

      client.search(index: index, searchType: "scan", scroll: scroll).
      then((response) ->
        return response._scroll_id
      ).
      catch((error) ->
        throw error
      ).
      then((scrollId) ->
        return client.scroll(scrollId: scrollId, scroll: scroll)
      ).
      catch((error) ->
        throw error
      ).
      then(dumpIndexData = (response) ->
        scrollId = response._scroll_id
        docs = response.hits.hits

        if docs.length is 0 or not scrollId
          return # finished

        success += docs.length

        lodingView.updateMessage(
          "Dump Index Data #{index} ... #{success} docs.")

        for doc in docs
          delete doc["_score"]
          data = JSON.stringify(doc)
          fs.appendFileSync(fileName, "#{data}\r\n")

        client.scroll(scrollId: scrollId, scroll: scroll).
        then(dumpIndexData).
        catch((error) ->
          throw error
        )
      ).
      catch((error) ->
        notifications.addError(
          "Dump Index Data Error: #{error}", dismissable: true)
      ).
      then( ->
        lodingView.finish()
      )

    run: ({index}={}) ->
      if not index
        options =
          all: false
          defaultIndex: @index
        return showIndicesListView(@client, options, (item) ->
          new HelperDumpIndexData(index: item.index)
        )

      @dump(@client, index, scroll: @scroll)
