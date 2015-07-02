{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class FieldsListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-tag', "#{item.name}"



showFieldsListView = (client, {index, docType}={}, callback) ->
  options =
    index: index
    type: docType
    field: "*"

  client.indices.getFieldMapping(options).
  then((response) ->
    fields = Object.keys(response[index].mappings[docType])
    fields.sort()
    items = []
    for field in fields
      items.push({name: field})
    return new FieldsListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )

module.exports.showFieldsListView = showFieldsListView
