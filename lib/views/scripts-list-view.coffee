{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class ScriptsListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-file-code', "#{item.name}"


showScriptsListView = (client, callback) ->

  options =
    index: ".scripts"
    body: {
      "_source": false,
      "size": 100
    }

  client.search(options).
  then((response) ->
    items = []

    for doc in response.hits.hits
      items.push({name: "#{doc._type}/#{doc._id}", lang: doc._type, id: doc._id})

    items.sort()

    return new ScriptsListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showScriptsListView = showScriptsListView
