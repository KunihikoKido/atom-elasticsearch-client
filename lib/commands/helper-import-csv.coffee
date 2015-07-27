fs = require 'fs-plus'
Promise = require 'promise'
{allowUnsafeNewFunction} = require 'loophole'
CSV = require 'comma-separated-values'
{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
{showDocTypeListView} = require '../views/doc-type-list-view'
notifications = require '../notifications'
LoadingView = require '../views/loading-view'
dialog = require "../dialog"
chunk = require "chunk"

readFile = Promise.denodeify(fs.readFile)


module.exports =
  class HelperImportCsv extends CreateCommand

    isEnabled: ->
      return true

    import: (client, index, docType, {chunkSize}) ->
      fileName = dialog.openFile()
      if fileName is undefined
        return # canceled

      loadingView = new LoadingView()
      success = 0

      loadingView.updateMessage(
        "Loading #{index}/#{docType} ... #{success} docs.")

      readFile(fileName, "utf-8").
      then((str) ->
        csv = new CSV(str, header: true)
        rows = allowUnsafeNewFunction -> csv.parse()

        for docs in chunk(rows, chunkSize)
          actions = []
          for doc in docs
            action = {index: {}}
            action.index["_id"] = doc.id if doc.id
            actions.push(action)
            actions.push(doc)
          client.bulk(index: index, type: docType, body: actions).
          then((response) ->
            success += response.items.length
            loadingView.updateMessage(
              "Loading #{index}/#{docType} ... #{success} docs.")
          ).
          catch((error) ->
            throw error
          )
      ).
      catch((error) ->
        notifications.addError("Import Error: #{error}", dismissable: true)
      ).
      then( ->
        loadingView.finish()
      )

    run: ({index, docType}={}) ->
      if not index
        options =
          all: false
          defaultIndex: @index
        return showIndicesListView(@client, options, (item) ->
          new HelperImportCsv(index: item.index)
        )

      if not docType
        return showDocTypeListView(@client, index: @index, (item) ->
          new HelperImportCsv(index: index, docType: item.docType)
        )

      @import(@client, index, docType, chunkSize: 100)
