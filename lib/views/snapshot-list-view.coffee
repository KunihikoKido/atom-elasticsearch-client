{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class SnapshotListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-package', "#{item.name} (#{item.state})"
        @div class: 'secondary-line no-icon text-subtle', "indices: #{item.indices.join(", ")}"


showSnapshotListView = (client, repository, callback) ->

  client.snapshot.get(repository: repository, snapshot: "_all").
  then((response) ->
    items = []
    for snapshot in response.snapshots
      items.push({
        name: "#{snapshot.snapshot}",
        snapshot: snapshot.snapshot,
        indices: snapshot.indices
        state: snapshot.state
      })

    return new SnapshotListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showSnapshotListView = showSnapshotListView
