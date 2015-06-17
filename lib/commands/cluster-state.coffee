{BaseCommand} = require './base'

module.exports =
class ClusterState extends BaseCommand

  run: ->
    @client.cluster.state({}, @showResult)
