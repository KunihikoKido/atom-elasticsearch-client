{DeleteCommand} = require './base'
dialog = require '../dialog'
{showRepositoryListView} = require '../views/repository-list-view'


module.exports =
class SnapshotDeleteRepository extends DeleteCommand

  run: ({repository}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotDeleteRepository(repository: item.repository)
      )

    if dialog.okCancel("Are you sure you want to delete?\nRepository : #{repository}", okTitle: "Delete")
      @client.snapshot.deleteRepository(repository: repository, @showResult)
