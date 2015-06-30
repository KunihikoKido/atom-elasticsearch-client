{CatBaseCommand} = require './base'

module.exports =
class CatSegments extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Segments")

    @client.cat.segments(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
