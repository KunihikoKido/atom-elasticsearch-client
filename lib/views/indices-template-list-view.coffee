{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class IndicesTemplateListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-database', "#{item.name}"


showIndicesTemplateListView = (client, callback) ->

  client.indices.getTemplate().
  then((response) ->
    items = []

    for template of response
      items.push({name: "#{template}", template: template})

    items.sort()

    return new IndicesTemplateListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showIndicesTemplateListView = showIndicesTemplateListView
