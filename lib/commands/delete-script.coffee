{DeleteCommand} = require './base'
ScriptInputView = require '../views/script-input-view'
dialog = require '../dialog'


module.exports =
class DeleteScript extends DeleteCommand

  run: ({lang, id}={}) ->
    if not lang or not id
      return new ScriptInputView((item) ->
        new DeleteScript(lang: item.lang, id: item.id)
      )

    if dialog.okCancel("Are you sure you want to delete?\nScript: #{lang}/#{id}", okTitle: "Delete")
      options =
        lang: lang
        id: id

      @client.deleteScript(options, @showResult)
