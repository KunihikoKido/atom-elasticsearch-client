{BaseCommand} = require './base'

module.exports =
class ClusterHealth extends BaseCommand

  isEnabled: ->
    return true
    
  run: ->
    @client.cluster.health({}, @showResult)
