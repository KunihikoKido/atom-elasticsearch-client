{BaseCommand} = require './base'

module.exports =
class NodesInfo extends BaseCommand

  run: ->
    options =
      human: true

    @client.nodes.info({}, @showResult)
