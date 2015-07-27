{DeleteCommand} = require './base'
{showWarmersListView} = require '../views/warmers-list-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteWarmer extends DeleteCommand

  isEnabled: ->
    return true

  run: ({name}={}) ->
    if not name
      return showWarmersListView(@client, index: @index, (item) ->
        new IndicesDeleteWarmer(name: item.id)
      )

    if dialog.okCancel("Are you sure you want to delete?\nWarmer : #{name}", okTitle: "Delete")
      options =
        index: @index
        name: name

      @client.indices.deleteWarmer(options, @showResult)
