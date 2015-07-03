{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'

class NodesListView extends ListView

  viewForItem: (item) ->
    if item.name.slice(0, 1) is "_"
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-server', "#{item.name}"
    else
      $$ ->
        @li =>
          @div class: 'primary-line icon icon-server', "#{item.name} (#{item.nodeId})"
          @div class: 'secondary-line no-icon text-subtle', =>
            @div "#{item.host} / #{item.transport_address}"
            @div "version: #{item.version}"


showNodesListView = (client, callback) ->
  client.nodes.info().
  then((response) ->
    items = []
    for nodeId, node of response.nodes
      items.push({
        name: node.name,
        nodeId: nodeId,
        host: node.host,
        transport_address: node.transport_address
        version: node.version
      })

    items.unshift({name: "_master", nodeId: "_master"})
    items.unshift({name: "_local", nodeId: "_local"})
    items.unshift({name: "_all", nodeId: "_all"})

    return new NodesListView(items, callback)
  )

module.exports.showNodesListView = showNodesListView
