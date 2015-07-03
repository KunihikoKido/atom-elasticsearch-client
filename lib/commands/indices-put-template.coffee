{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class IndicesPutTemplate extends CreateCommand

  run: ({template}={}) ->
    if not name
      return new InputView(
        'Required: template name to create',
        (value) -> new IndicesPutTemplate(template: value))

    options =
      name: template
      body: @getText()

    @client.indices.putTemplate(options, @showResult)
