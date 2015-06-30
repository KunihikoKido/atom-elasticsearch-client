{CatBaseCommand} = require './base'

module.exports =
class CatFielddata extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Fielddata")

    @client.cat.fielddata(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
