{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class FieldStats extends BaseCommand

  run: ({fields}={}) ->
    if not fields
      return new InputView(
        'Required: a comma-separated list of fields for to get field statistics for (min value, max value, and more)',
        (value) -> new FieldStats(fields: value))

    options =
      index: @index
      fields: fields

    @client.fieldStats(options, @showResult)
