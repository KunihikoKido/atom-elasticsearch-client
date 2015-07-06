{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class AliasListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-link', "#{item.name}"


showAliasListView = (client, {index}={}, callback) ->

  client.indices.getAlias(index: index).
  then((response) ->

    items = []

    for index, aliases of response
      for alias, value of aliases.aliases
        items.push({name: "#{alias} (#{index})", index: index, alias: alias})

    return new AliasListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showAliasListView = showAliasListView
