{BaseCommand} = require './base'

module.exports =
class NodesHotThreads extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.nodes.hotThreads({}, @showResult)
