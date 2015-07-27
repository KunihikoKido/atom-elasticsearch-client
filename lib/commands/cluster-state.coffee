{BaseCommand} = require './base'

module.exports =
class ClusterState extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.cluster.state({}, @showResult)
