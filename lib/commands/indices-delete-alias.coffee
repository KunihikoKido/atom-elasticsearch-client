{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteAlias extends DeleteCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: alias name to delete',
        (value) -> new IndicesDeleteAlias(name: value))

    if dialog.okCancel("Are you sure you want to delete?\nAlias : #{name}", okTitle: "Delete")
      options =
        index: @index
        name: name

      @client.indices.deleteAlias(options, @showResult)
