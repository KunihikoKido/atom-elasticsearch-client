{DeleteCommand} = require './base'
{showAliasListView} = require '../views/alias-list-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteAlias extends DeleteCommand

  isEnabled: ->
    return true

  run: ({index, name}={}) ->
    if not index or not name
      return showAliasListView(@client, index: @index, (item) ->
        new IndicesDeleteAlias(index: item.index, name: item.alias)
      )

    if dialog.okCancel("Are you sure you want to delete?\nAlias :#{name} (#{index})", okTitle: "Delete")
      options =
        index: index
        name: name

      @client.indices.deleteAlias(options, @showResult)
