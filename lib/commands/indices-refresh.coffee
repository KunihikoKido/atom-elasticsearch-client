{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesRefresh extends CreateCommand

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesRefresh(index: item.index)
      )

    @client.indices.refresh(index: index, @showResult)
