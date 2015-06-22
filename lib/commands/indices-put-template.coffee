{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class IndicesPutTemplate extends CreateCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: template name to create',
        (value) -> new IndicesPutTemplate(name: value))

    options =
      index: @index
      name: name
      body: @getText()

    @client.indices.putTemplate(options, @showResult)
