{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class IndicesPutWarmer extends CreateCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: warmer name to create',
        (value) -> new IndicesPutWarmer(name: value))

    options =
      index: @index
      name: name
      body: @getText()

    @client.indices.putWarmer(options, @showResult)
