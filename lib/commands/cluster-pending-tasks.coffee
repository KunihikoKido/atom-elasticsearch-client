{BaseCommand} = require './base'

module.exports =
class ClusterPendingTasks extends BaseCommand

  run: ->
    @client.cluster.pendingTasks({}, @showResult)
