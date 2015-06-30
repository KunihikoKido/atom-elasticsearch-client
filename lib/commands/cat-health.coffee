{CatBaseCommand} = require './base'

module.exports =
class CatHealth extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Health")

    @client.cat.health(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
