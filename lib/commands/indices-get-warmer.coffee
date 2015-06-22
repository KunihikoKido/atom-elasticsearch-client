{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesGetWarmer extends BaseCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: warmer name to get. (supports wildcards)',
        (value) -> new IndicesGetWarmer(name: value))

    options =
      index: @index
      name: name

    @client.indices.getWarmer(options, @showResult)
