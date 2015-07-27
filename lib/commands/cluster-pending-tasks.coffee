{BaseCommand} = require './base'

module.exports =
class ClusterPendingTasks extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.cluster.pendingTasks({}, @showResult)
