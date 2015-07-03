{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class DocTypeListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-package', "#{item.name}"


showDocTypeListView = (client, {index}={}, callback) ->
  options =
    index: index

  client.indices.getMapping(options).
  then((response) ->
    if response[index].mappings
      docTypes = Object.keys(response[index].mappings)
      docTypes.sort()
    else
      docTypes = []

    items = []
    for name in docTypes
      if name isnt "_default_"
        items.push({name: "#{name}", docType: name})

    return new DocTypeListView(items, callback)
  ).
  catch((error) ->
    if error.status is 404
      return new DocTypeListView([])
    notifications.addError(error)
  )


module.exports.showDocTypeListView = showDocTypeListView
