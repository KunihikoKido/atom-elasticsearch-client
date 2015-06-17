{CreateCommand} = require './base'

module.exports =
class ClusterReroute extends CreateCommand

  run: ->
    options =
      body: @getText()

    @client.cluster.reroute(options, @showResult)
