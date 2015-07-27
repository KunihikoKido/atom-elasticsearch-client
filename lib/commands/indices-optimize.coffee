{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesOptimize extends CreateCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesOptimize(index: item.index)
      )

    @client.indices.optimize(index: index, @showResult)
