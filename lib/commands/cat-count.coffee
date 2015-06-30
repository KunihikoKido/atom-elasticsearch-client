{CatBaseCommand} = require './base'

module.exports =
class CatCount extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Count")

    @client.cat.count(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
