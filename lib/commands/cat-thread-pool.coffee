{CatBaseCommand} = require './base'

module.exports =
class CatThreadPool extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Thread Pool")

    @client.cat.threadPool(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
