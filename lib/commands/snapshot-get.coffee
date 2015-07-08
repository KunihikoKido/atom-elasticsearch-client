{BaseCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'
{showSnapshotListView} = require '../views/snapshot-list-view'


module.exports =
class SnapshotGet extends BaseCommand

  run: ({repository, snapshot}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotGet(repository: item.repository)
      )

    if not snapshot
      return showSnapshotListView(@client, repository, (item) ->
        new SnapshotGet(repository: repository, snapshot: item.snapshot)
      )

    options =
      repository: repository
      snapshot: snapshot

    @client.snapshot.get(options, @showResult)
