{BaseCommand} = require './base'

module.exports =
class ClusterStats extends BaseCommand

  run: ->
    @client.cluster.stats({}, @showResult)
