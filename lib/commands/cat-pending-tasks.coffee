{CatBaseCommand} = require './base'

module.exports =
class CatPendingTasks extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Pending Tasks")

    @client.cat.pendingTasks(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
