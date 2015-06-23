{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class DeleteSearchTemplate extends DeleteCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: template id to delete search template',
        (value) -> new DeleteSearchTemplate(id: value))

    if dialog.okCancel("Are you sure you want to delete?\nTemplate id: #{id}", okTitle: "Delete")
      options =
        id: id

      @client.deleteTemplate(options, @showResult)
