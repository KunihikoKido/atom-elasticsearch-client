{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class IndicesListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-database', "#{item.name}"


showIndicesListView = (client, {all, defaultIndex}={}, callback) ->

  client.cluster.state().
  then((response) ->
    items = []
    if response.metadata
      for name, info of response.metadata.indices
        items.push({name: "#{name}", index: name})
    items.sort()
    if all
      items.unshift({name: "*", index: ""})
    return new IndicesListView(items, callback)
  ).
  catch((error) ->
    return new IndicesListView(
      [{name: "#{defaultIndex}", index: defaultIndex}],
      callback)
  )


module.exports.showIndicesListView = showIndicesListView
