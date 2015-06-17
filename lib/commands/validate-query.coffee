{BaseCommand} = require './base'

module.exports =
class ValidateQuery extends BaseCommand

  run: ->
    options =
      explain: true
      index: @index
      type: @type
      body: @getText()

    @client.indices.validateQuery(options, @showResult)
