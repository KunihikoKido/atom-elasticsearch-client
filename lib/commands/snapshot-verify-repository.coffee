{BaseCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'


module.exports =
class SnapshotVerifyRepository extends BaseCommand

  run: ({repository}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotVerifyRepository(repository: item.repository)
      )

    options =
      repository: repository

    @client.snapshot.verifyRepository(options, @showResult)
