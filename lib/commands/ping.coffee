{BaseCommand} = require './base'

module.exports =
class Ping extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.ping({}, @showResult)
