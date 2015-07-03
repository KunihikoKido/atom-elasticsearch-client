{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class IndicesGetSettings extends BaseCommand

  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new IndicesGetSettings(index: item.index)
      )

    console.log(index)
    options =
      index: index

    @client.indices.getSettings(options, @showResult)
