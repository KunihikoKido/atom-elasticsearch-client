{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SnapshotCreate extends CreateCommand

  getSnapshotName: ()->
    now   = new Date()
    year  = now.getFullYear()
    month = now.getMonth() + 1
    date  = now.getDate()
    hour  = now.getHours()
    min   = now.getMinutes()
    name = "#{@index}-#{year}#{month}#{date}#{hour}#{min}"
    return name


  run: ({repository}={}) ->
    if not repository
      return new InputView(
        'Required: repository to create repository',
        (value) -> new SnapshotCreate(repository: value))

    now = new Date()

    year = now.getFullYear()
    month = now.getMonth() + 1

    options =
      repository: repository
      snapshot: @getSnapshotName()
      body:
        indices: "#{@index}"

    @client.snapshot.create(options, @showResult)
