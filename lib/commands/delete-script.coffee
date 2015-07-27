{DeleteCommand} = require './base'
{showScriptsListView} = require '../views/scripts-list-view'
dialog = require '../dialog'


module.exports =
class DeleteScript extends DeleteCommand

  isEnabled: ->
    return true

  run: ({lang, id}={}) ->
    if not lang or not id
      return showScriptsListView(@client, (item) ->
        new DeleteScript(lang: item.lang, id: item.id)
      )

    if dialog.okCancel("Are you sure you want to delete?\nScript: #{lang}/#{id}", okTitle: "Delete")
      options =
        lang: lang
        id: id

      @client.deleteScript(options, @showResult)
