{CatBaseCommand} = require './base'


module.exports =
class CatAllocation extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Allocation")

    @client.cat.allocation(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
