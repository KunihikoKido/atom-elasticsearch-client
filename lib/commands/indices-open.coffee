{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesOpen extends CreateCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesOpen(index: item.index)
      )

    @client.indices.open(index: index, @showResult)
