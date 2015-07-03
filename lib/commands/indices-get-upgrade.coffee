{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGetUpgrade extends BaseCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesGetUpgrade(index: item.index)
      )

    @client.indices.getUpgrade(index: index, human: true, @showResult)
