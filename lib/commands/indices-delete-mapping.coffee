{DeleteCommand} = require './base'
dialog = require '../dialog'
{showDocTypeListView} = require '../views/doc-type-list-view'

module.exports =
class IndicesDeleteMapping extends DeleteCommand

  run: ({docType}={}) ->
    if not docType
      return showDocTypeListView(@client, index: @index, (item) ->
        new IndicesDeleteMapping(docType: item.name)
      )

    if dialog.okCancel("Are you sure you want to delete?\nMapping: #{@index}/#{@docType}", okTitle: "Delete")
      options =
        index: @index
        type: @docType

      @client.indices.deleteMapping(options, @showResult)
