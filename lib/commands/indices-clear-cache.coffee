{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesClearCache extends CreateCommand

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesClearCache(index: item.index)
      )

    @client.indices.clearCache(index: index, @showResult)
