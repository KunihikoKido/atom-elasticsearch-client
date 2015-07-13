{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesSegments extends BaseCommand

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesSegments(index: item.index)
      )

    @client.indices.segments(index: index, human: true, @showResult)
