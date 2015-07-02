{DeleteCommand} = require './base'
dialog = require '../dialog'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesDelete extends DeleteCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, (item) ->
        new IndicesDelete(index: item.name)
      )

    if dialog.okCancel("Are you sure you want to delete?\nIndex: #{@index}", okTitle: "Delete")
      options =
        index: index

      @client.indices.delete(options, @showResult)
