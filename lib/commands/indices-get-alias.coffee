{BaseCommand} = require './base'
{showAliasListView} = require '../views/alias-list-view'
dialog = require '../dialog'


module.exports =
class IndicesGetAlias extends BaseCommand

  run: ({index, name}={}) ->
    if not index or not name
      return showAliasListView(@client, index: @index, (item) ->
        new IndicesGetAlias(index: item.index, name: item.alias)
      )

    options =
      index: index
      name: name

    @client.indices.getAlias(options, @showResult)
