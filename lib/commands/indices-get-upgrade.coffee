{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGetUpgrade extends BaseCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesGetUpgrade(index: item.index)
      )

    @client.indices.getUpgrade(index: index, human: true, @showResult)
