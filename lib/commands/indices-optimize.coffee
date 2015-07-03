{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesOptimize extends CreateCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesOptimize(index: item.index)
      )

    @client.indices.optimize(index: index, @showResult)
