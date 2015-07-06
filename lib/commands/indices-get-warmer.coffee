{BaseCommand} = require './base'
dialog = require '../dialog'
{showWarmersListView} = require '../views/warmers-list-view'


module.exports =
class IndicesGetWarmer extends BaseCommand

  run: ({name}={}) ->
    if not name
      return showWarmersListView(@client, index: @index, (item) ->
        new IndicesGetWarmer(name: item.id)
      )

    options =
      index: @index
      name: name

    @client.indices.getWarmer(options, @showResult)
