{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesGetAlias extends BaseCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: alias name to get infomation',
        (value) -> new IndicesGetAlias(name: value))

    options =
      index: @index
      name: name

    @client.indices.getAlias(options, @showResult)
