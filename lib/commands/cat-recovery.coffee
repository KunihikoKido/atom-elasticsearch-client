{CatBaseCommand} = require './base'

module.exports =
class CatRecovery extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Recovery")

    @client.cat.recovery(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
