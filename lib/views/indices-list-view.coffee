{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class IndicesListView extends ListView

  viewForItem: (item) ->
    if item.name is ""
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-database', "*"
    else
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-database', "#{item.name}"


showIndicesListView = (client, {all}={}, callback) ->

  client.indices.stats().
  then((response) ->
    items = []
    for name of response.indices
      items.push({name: name, index: name})

    if items.length is 0
      return new IndicesListView([])

    items.sort()

    if all
      items.unshift({name: "*", index: null})
    return new IndicesListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showIndicesListView = showIndicesListView
