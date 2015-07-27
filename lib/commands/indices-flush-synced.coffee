{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesFlushSynced extends CreateCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesFlushSynced(index: item.index)
      )

    @client.indices.flushSynced(index: index, @showResult)
