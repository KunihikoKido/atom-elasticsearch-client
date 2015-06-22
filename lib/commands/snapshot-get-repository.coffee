{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SnapshotGetRepository extends BaseCommand

  run: ({repository}={}) ->
    if repository is undefined
      return new InputView(
        'Option: repository name to get information',
        (value) -> new SnapshotGetRepository(repository: value))

    options = {}
    options.repository = if repository then repository

    @client.snapshot.getRepository(options, @showResult)
