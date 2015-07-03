{BaseCommand} = require './base'
ScriptInputView = require '../views/script-input-view'


module.exports =
class GetScript extends BaseCommand

  run: ({lang, id}={}) ->
    if not lang or not id
      return new ScriptInputView((item) ->
        new GetScript(lang: item.lang, id: item.id)
      )

    options =
      lang: lang
      id: id

    @client.getScript(options, @showResult)
