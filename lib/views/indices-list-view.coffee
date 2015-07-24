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

  client.cluster.state(ignore: [403]).
  then((response) ->
    items = []
    items.push({name: "#{defaultIndex}", index: defaultIndex})
    if response.metadata
      for name, info of response.metadata.indices
        if name isnt defaultIndex
          items.push({name: "#{name}", index: name})

    items.sort()

    if all
      items.unshift({name: "*", index: ""})
    return new IndicesListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showIndicesListView = showIndicesListView
