{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesGetTemplate extends BaseCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: template name to get',
        (value) -> new IndicesGetTemplate(name: value))

    options =
      name: name

    @client.indices.getTemplate(options, @showResult)
