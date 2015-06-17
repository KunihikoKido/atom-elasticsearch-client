{BaseCommand} = require './base'

module.exports =
class Info extends BaseCommand

  run: ->
    @client.info({}, @showResult)
