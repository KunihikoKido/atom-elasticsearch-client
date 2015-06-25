InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class PutSearchTemplate extends CreateCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: template id to put template',
        (value) -> new PutSearchTemplate(id: value))

    options =
      id: id
      body: @getText()

    @client.putTemplate(options, @showResult)
