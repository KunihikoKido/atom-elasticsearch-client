{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGet extends BaseCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesGet(index: item.index)
      )

    @client.indices.get(index: index, @showResult)
