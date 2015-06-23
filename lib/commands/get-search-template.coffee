{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class GetSearchTemplate extends BaseCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: template id to get search template',
        (value) -> new GetSearchTemplate(id: value))

    options =
      id: id

    @client.getTemplate(options, @showResult)
