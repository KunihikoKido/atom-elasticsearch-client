{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'

class NodesListView extends ListView

  viewForItem: (item) ->
    if item.name is ""
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-server', "*"
    else
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-server', "#{item.name} (#{item.id})"
          @div class: 'secondary-line no-icon text-subtle', =>
            @div "#{item.host} / #{item.transport_address}"
            @div "version: #{item.version}"


showNodesListView = (callback) ->
  client = config.getClient()
  client.nodes.info().
  then((response) ->
    items = [{name: ""}]
    for nodeId, nodeInfo of response.nodes
      nodeInfo.id = nodeId
      items.push(nodeInfo)
    return new NodesListView(items, callback)
  )

module.exports.showNodesListView = showNodesListView
