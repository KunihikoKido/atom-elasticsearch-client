{CatBaseCommand} = require './base'


module.exports =
class CatAliases extends CatBaseCommand
  run: ->
    responseView = @getResponseView(title: "Aliases")

    @client.cat.aliases(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
