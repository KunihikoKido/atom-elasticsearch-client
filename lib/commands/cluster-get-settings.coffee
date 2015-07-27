{BaseCommand} = require './base'

module.exports =
class ClusterGetSettings extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.cluster.getSettings({}, @showResult)
