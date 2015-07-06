{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class SearchTemplateListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-file-code', "#{item.name}"


showSearchTemplateListView = (client, callback) ->

  options =
    index: ".scripts"
    type: "mustache"
    body: {
      "_source": false,
      "size": 100
    }

  client.search(options).
  then((response) ->
    items = []

    for doc in response.hits.hits
      items.push({name: "#{doc._id}", id: doc._id})

    items.sort()

    return new SearchTemplateListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showSearchTemplateListView = showSearchTemplateListView
