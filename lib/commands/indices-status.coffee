{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesStatus extends BaseCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesStatus(index: item.index)
      )

    @client.indices.status(index: index, human: true, @showResult)
