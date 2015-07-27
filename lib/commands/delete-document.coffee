{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class DeleteDocument extends DeleteCommand

  isEnabled: ->
    return true

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to delete document',
        (value) -> new DeleteDocument(id: value))

    if dialog.okCancel("Are you sure you want to delete?\nDocument id: #{id}", okTitle: "Delete")
      options =
        index: @index
        type: @docType
        id: id

      @client.delete(options, @showResult)
