{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesRecovery extends BaseCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesRecovery(index: item.index)
      )

    @client.indices.recovery(index: index, human: true, @showResult)
