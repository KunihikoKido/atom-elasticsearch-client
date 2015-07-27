{DeleteCommand} = require './base'
SnapshotInputView = require '../views/snapshot-input-view'
dialog = require '../dialog.coffee'

module.exports =
class SnapshotRestore extends DeleteCommand

  isEnabled: ->
    return true

  run: ({repository, snapshot}={}) ->
    if not repository or not snapshot
      return new SnapshotInputView((items) ->
        new SnapshotRestore(items)
      )

    if dialog.okCancel("Are you sure you want to delete?\n
        Repository :#{repository}\n
        Snapshot: #{snapshot}", okTitle: "Delete")

      options =
        repository: repository
        snapshot: snapshot

      @client.snapshot.delete(options, @showResult)
