{BaseCommand} = require './base'

module.exports =
class ClusterHealth extends BaseCommand

  run: ->
    @client.cluster.health({}, @showResult)
