{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesStats extends BaseCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesStats(index: item.index)
      )

    @client.indices.stats(index: index, human: true, @showResult)
