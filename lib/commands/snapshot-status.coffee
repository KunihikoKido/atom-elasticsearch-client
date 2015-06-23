{BaseCommand} = require './base'
SnapshotInputView = require '../views/snapshot-input-view'


module.exports =
class SnapshotStatus extends BaseCommand

  run: ({repository, snapshot}={}) ->
    if not repository or not snapshot
      return new SnapshotInputView((items) ->
        new SnapshotStatus(items)
      )

    options =
      repository: repository
      snapshot: snapshot

    @client.snapshot.status(options, @showResult)
