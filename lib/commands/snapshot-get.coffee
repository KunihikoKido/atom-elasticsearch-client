{BaseCommand} = require './base'
SnapshotInputView = require '../views/snapshot-input-view'


module.exports =
class SnapshotGet extends BaseCommand

  run: ({repository, snapshot}={}) ->
    if not repository or not snapshot
      return new SnapshotInputView((items) ->
        new SnapshotGet(items)
      )

    options =
      repository: repository
      snapshot: snapshot

    @client.snapshot.get(options, @showResult)
