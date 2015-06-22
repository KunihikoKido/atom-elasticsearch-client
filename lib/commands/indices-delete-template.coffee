{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteTemplate extends DeleteCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: template name to delete',
        (value) -> new IndicesDeleteTemplate(name: value))

    if dialog.okCancel("Are you sure you want to delete?\nTemplate : #{name}", okTitle: "Delete")
      options =
        name: name

      @client.indices.deleteTemplate(options, @showResult)
