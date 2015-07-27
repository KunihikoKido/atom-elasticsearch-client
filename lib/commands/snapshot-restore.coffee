{CreateCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'
{showSnapshotListView} = require '../views/snapshot-list-view'
notifications = require '../notifications'
LoadingView = require '../views/loading-view'


module.exports =
class SnapshotRestore extends CreateCommand

  isEnabled: ->
    return true

  restore: (client, {repository, snapshot, indices}={}) ->

    for index in indices
      lodingView = new LoadingView()
      client.indices.close(index: index).
      then((response) ->
        lodingView.updateMessage("Restoreing #{index} ... Please wait.")
        options =
          repository: repository
          snapshot: snapshot
        client.snapshot.restore(options).
        then((response) ->
          client.indices.open(index: index)
        ).
        catch((error) ->
          throw error
        )
      ).
      catch((error) ->
        notifications.addError("#{error}", dismissable: true)
      ).
      then(() ->
        # body...
        lodingView.updateMessage("Finished Restore: #{index}")
        lodingView.finish()
      )

  run: ({repository, snapshot, indices}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotRestore(repository: item.repository)
      )

    if not snapshot
      return showSnapshotListView(@client, repository, (item) ->
        new SnapshotRestore({
          repository: repository,
          snapshot: item.snapshot,
          indices: item.indices
        })
      )

    options =
      repository: repository
      snapshot: snapshot
      indices: indices

    @restore(@client, options)
