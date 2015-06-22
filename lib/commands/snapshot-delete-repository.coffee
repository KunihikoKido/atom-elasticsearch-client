{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class SnapshotDeleteRepository extends DeleteCommand

  run: ({repository}={}) ->
    if not repository
      return new InputView(
        'Required: repository name to delete',
        (value) -> new SnapshotDeleteRepository(repository: value))

    if dialog.okCancel("Are you sure you want to delete?\nRepository : #{repository}", okTitle: "Delete")
      options =
        repository: repository

      @client.snapshot.deleteRepository(options, @showResult)
