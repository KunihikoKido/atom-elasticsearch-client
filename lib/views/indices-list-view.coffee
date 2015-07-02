{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'

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


showIndicesListView = (client, callback) ->
  client.indices.stats().
  then((response) ->
    items = [{name: ""}]
    for name of response.indices
      items.push({name: name})
    return new IndicesListView(items, callback)
  )

module.exports.showIndicesListView = showIndicesListView
