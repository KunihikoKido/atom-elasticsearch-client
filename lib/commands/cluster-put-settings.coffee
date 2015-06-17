{CreateCommand} = require './base'

module.exports =
class ClusterPutSettings extends CreateCommand

  run: ->
    options =
      body: @getText()

    @client.cluster.putSettings(options, @showResult)
