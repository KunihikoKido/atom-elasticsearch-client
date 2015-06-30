{CatBaseCommand} = require './base'

module.exports =
class CatMaster extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Master")

    @client.cat.master(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
