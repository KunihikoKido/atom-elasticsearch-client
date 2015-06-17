{BaseCommand} = require './base'

module.exports =
class ClusterGetSettings extends BaseCommand

  run: ->
    @client.cluster.getSettings({}, @showResult)
