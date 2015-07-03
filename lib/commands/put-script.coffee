{CreateCommand} = require './base'
ScriptInputView = require '../views/script-input-view'


module.exports =
class PutScript extends CreateCommand

  run: ({lang, id}={}) ->
    if not lang or not id
      return new ScriptInputView((item) ->
        new PutScript(lang: item.lang, id: item.id)
      )

    options =
      lang: lang
      id: id
      body: @getText()

    @client.putScript(options, @showResult)
