{BaseCommand} = require './base'

module.exports =
class NodesInfo extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    options =
      human: true

    @client.nodes.info({}, @showResult)
