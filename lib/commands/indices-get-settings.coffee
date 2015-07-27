{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGetSettings extends BaseCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new IndicesGetSettings(index: item.index)
      )

    options =
      index: index

    @client.indices.getSettings(options, @showResult)
