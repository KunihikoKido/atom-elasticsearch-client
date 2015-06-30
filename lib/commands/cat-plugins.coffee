{CatBaseCommand} = require './base'

module.exports =
class CatPlugins extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Plugins")

    @client.cat.plugins(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
