{BaseCommand} = require './base'

module.exports =
class ClusterStats extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.cluster.stats({}, @showResult)
