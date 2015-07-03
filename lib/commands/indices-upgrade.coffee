{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesUpgrade extends CreateCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesUpgrade(index: item.index)
      )

    @client.indices.upgrade(index: index, @showResult)
