{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteWarmer extends DeleteCommand

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: warmer name to delete. (supports wildcards)',
        (value) -> new IndicesDeleteWarmer(name: value))

    if dialog.okCancel("Are you sure you want to delete?\nWarmer : #{name}", okTitle: "Delete")
      options =
        index: @index
        name: name

      @client.indices.deleteWarmer(options, @showResult)
