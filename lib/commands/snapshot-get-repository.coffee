{BaseCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'


module.exports =
class SnapshotGetRepository extends BaseCommand

  run: ({repository}={}) ->
    if not repository
      return showRepositoryListView(@client, (item) ->
        new SnapshotGetRepository(repository: item.repository)
      )

    @client.snapshot.getRepository(repository: repository, @showResult)
