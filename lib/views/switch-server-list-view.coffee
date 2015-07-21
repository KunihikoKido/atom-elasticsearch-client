{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'


class SwitchServerListView extends ListView
  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-database', "#{item.index}/#{item.docType}"
        @div class: 'secondary-line no-icon text-subtle', item.baseUrl


showSwitchServerListView = (callback) ->
  items = []
  for item in config.getServers()
    item.name = "#{item.baseUrl}/#{item.index}/#{item.docType}"
    items.push(item)
  return new SwitchServerListView(items, callback)

module.exports.showSwitchServerListView = showSwitchServerListView
