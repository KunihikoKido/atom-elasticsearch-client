{DeleteCommand} = require './base'
{showSearchTemplateListView} = require '../views/search-template-list-view'
dialog = require '../dialog'


module.exports =
class DeleteSearchTemplate extends DeleteCommand

  isEnabled: ->
    return true

  run: ({id}={}) ->
    if not id
      return showSearchTemplateListView(@client, (item) ->
        new DeleteSearchTemplate(id: item.id)
      )

    if dialog.okCancel("Are you sure you want to delete?\nTemplate id: #{id}", okTitle: "Delete")
      options =
        id: id

      @client.deleteTemplate(options, @showResult)
