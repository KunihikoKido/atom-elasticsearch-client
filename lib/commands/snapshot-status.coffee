{BaseCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'
{showSnapshotListView} = require '../views/snapshot-list-view'


module.exports =
class SnapshotStatus extends BaseCommand

  run: ({repository, snapshot}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotStatus(repository: item.repository)
      )

    if not snapshot
      return showSnapshotListView(@client, repository, (item) ->
        new SnapshotStatus(repository: repository, snapshot: item.snapshot)
      )

    options =
      repository: repository
      snapshot: snapshot

    @client.snapshot.status(options, @showResult)
