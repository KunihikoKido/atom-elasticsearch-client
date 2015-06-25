{BaseCommand} = require './base'

module.exports =
class Ping extends BaseCommand

  run: ->
    @client.ping({}, @showResult)
