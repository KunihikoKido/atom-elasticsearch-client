{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SnapshotVerifyRepository extends BaseCommand

  run: ({repository}={}) ->
    if not repository
      return new InputView(
        'Required: repository name to verify',
        (value) -> new SnapshotVerifyRepository(repository: value))

    options =
      repository: repository

    @client.snapshot.verifyRepository(options, @showResult)
