{CreateCommand} = require './base'
{showRepositoryListView} = require '../views/repository-list-view'


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
      return showRepositoryListView(@client, (item) ->
        new SnapshotCreate(repository: item.repository)
      )

    options =
      repository: repository
      snapshot: @getSnapshotName()
      body:
        indices: "#{@index}"

    @client.snapshot.create(options, @showResult)
