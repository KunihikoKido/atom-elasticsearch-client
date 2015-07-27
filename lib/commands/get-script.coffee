{BaseCommand} = require './base'
{showScriptsListView} = require '../views/scripts-list-view'


module.exports =
class GetScript extends BaseCommand

  isEnabled: ->
    return true

  run: ({lang, id}={}) ->
    if not lang or not id
      return showScriptsListView(@client, (item) ->
        new GetScript(lang: item.lang, id: item.id)
      )

    options =
      lang: lang
      id: id

    @client.getScript(options, @showResult)
