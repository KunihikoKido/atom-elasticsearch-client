{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesStats extends BaseCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesStats(index: item.index)
      )

    @client.indices.stats(index: index, human: true, @showResult)
