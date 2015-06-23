{BaseCommand} = require './base'
ScriptInputView = require '../views/script-input-view'


module.exports =
class GetScript extends BaseCommand

  run: ({lang, id}={}) ->
    if not lang or not id
      return new ScriptInputView((items) ->
        new GetScript(items)
      )

    options =
      index: @index
      type: @docType
      lang: lang
      id: id

    @client.deleteScript(options, @showResult)
