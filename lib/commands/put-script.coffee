{CreateCommand} = require './base'
ScriptInputView = require '../views/script-input-view'


module.exports =
class PutScript extends CreateCommand

  run: ({lang, id}={}) ->
    if not lang or not id
      return new ScriptInputView((items) ->
        new PutScript(items)
      )

    options =
      index: @index
      type: @docType
      lang: lang
      id: id

    @client.putScript(options, @showResult)
