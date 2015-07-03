{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesFlushSynced extends CreateCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesFlushSynced(index: item.index)
      )

    @client.indices.flushSynced(index: index, @showResult)
