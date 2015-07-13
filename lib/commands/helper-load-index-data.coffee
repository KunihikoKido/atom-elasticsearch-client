fs = require 'fs-plus'
Promise = require 'promise'

{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
notifications = require '../notifications'
LoadingView = require '../views/loading-view'
dialog = require "../dialog"

readFile = Promise.denodeify(fs.readFile)

Array::chunk = (chunkSize) ->
  array = this
  [].concat.apply [], array.map((elem, i) ->
    (if i % chunkSize then [] else [array.slice(i, i + chunkSize)])
  )

expandAction = (doc) ->
  action = {index: {}}
  for key in ["_parent", "_percolate", "_routing", "_timestamp",
    "_ttl", "_type", "_version", "_version_type", "_id",
    "_retry_on_conflict"]

    if key in Object.keys(doc)
      action.index[key] = doc[key]
  return action

module.exports =
  class HelperLoadIndexData extends BaseCommand
    chunkSize: 1000

    load: (client, index, {chunkSize}={}) ->
      fileName = dialog.openFile()
      if fileName is undefined
        return # canceled

      loadingView = new LoadingView()
      success = 0

      loadingView.updateMessage("Loading #{index} ... #{success} docs.")

      readFile(fileName, "utf-8").
      then((str) ->
        data = str.split("\r\n")
        for docs in data.chunk(chunkSize)
          actions = []
          for doc in docs
            if doc
              doc = JSON.parse(doc)
              actions.push(expandAction(doc))
              actions.push(doc._source)
          if actions
            client.bulk(index: index, body: actions).
            then((response) ->
              success += response.items.length
              loadingView.updateMessage("Loading #{index} ... #{success} docs.")
            ).
            catch((error) ->
              throw error
            )
      ).
      catch((error) ->
        notifications.addError(
          "Load Index Data Error: #{error}", dismissable: true)
      ).
      then( ->
        loadingView.finish()
      )

    run: ({index}={}) ->
      if not index
        options =
          all: false
          defaultIndex: @index
        return showIndicesListView(@client, options, (item) ->
          new HelperLoadIndexData(index: item.index)
        )

      @load(@client, index, chunkSize: @chunkSize)
