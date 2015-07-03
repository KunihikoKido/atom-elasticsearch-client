{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesRefresh extends CreateCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesRefresh(index: item.index)
      )

    @client.indices.refresh(index: index, @showResult)
