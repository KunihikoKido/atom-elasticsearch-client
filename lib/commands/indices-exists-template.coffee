{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesExistsTemplate extends BaseCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: template name to exists',
        (value) -> new IndicesExistsTemplate(name: value))

    options =
      name: name

    @client.indices.existsTemplate(options, @showResult)
