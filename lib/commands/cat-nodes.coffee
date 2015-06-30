{CatBaseCommand} = require './base'

module.exports =
class CatNodes extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Nodes")

    @client.cat.nodes(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
