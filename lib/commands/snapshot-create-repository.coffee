{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SnapshotCreateRepository extends CreateCommand

  run: ({repository}={}) ->
    if not repository
      return new InputView(
        'Required: repository to create repository',
        (value) -> new SnapshotCreateRepository(repository: value))

    options =
      verify: false
      repository: repository
      body: @getText()

    @client.snapshot.createRepository(options, @showResult)
