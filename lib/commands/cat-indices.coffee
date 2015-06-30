{CatBaseCommand} = require './base'

module.exports =
class CatIndices extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Indices")

    @client.cat.indices(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
