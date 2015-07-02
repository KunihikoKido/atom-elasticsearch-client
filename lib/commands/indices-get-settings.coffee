{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGetSettings extends BaseCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, (item) ->
        new IndicesGetSettings(index: item.index)
      )

    options =
      index: index

    @client.indices.getSettings(options, @showResult)
