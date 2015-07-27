{BaseCommand} = require './base'

module.exports =
class Info extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    @client.info({}, @showResult)
