{CreateCommand} = require './base'
SnapshotInputView = require '../views/snapshot-input-view'


module.exports =
class SnapshotRestore extends CreateCommand

  run: ({repository, snapshot}={}) ->
    if not repository or not snapshot
      return new SnapshotInputView((items) ->
        new SnapshotRestore(items)
      )

    options =
      repository: repository
      snapshot: snapshot

    @client.snapshot.restore(options, @showResult)
