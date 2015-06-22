{BaseCommand} = require './base'

module.exports =
class NodesHotThreads extends BaseCommand

  run: ->
    @client.nodes.hotThreads({}, @showResult)
