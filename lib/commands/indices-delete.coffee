{DeleteCommand} = require './base'
dialog = require '../dialog'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesDelete extends DeleteCommand

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesDelete(index: item.index)
      )

    if dialog.okCancel("Are you sure you want to delete?\nIndex: #{index}", okTitle: "Delete")
      options =
        index: index

      @client.indices.delete(options, @showResult)
