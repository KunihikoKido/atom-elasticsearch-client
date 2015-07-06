{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class WarmersListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-flame', "#{item.name}"
        @div class: 'secondary-line no-icon text-subtle', item.types.join(", ")


showWarmersListView = (client, {index}={}, callback) ->

  client.indices.getWarmer(index: index).
  then((response) ->
    items = []

    for name, warmer of response[index].warmers
      items.push({name: "#{name}", id: name, types: warmer.types})

    items.sort()

    return new WarmersListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showWarmersListView = showWarmersListView
