{BaseCommand} = require './base'

module.exports =
class Suggest extends BaseCommand

  run: ->
    options =
      index: @index
      body: @getText()

    @client.suggest(options, @showResult)
