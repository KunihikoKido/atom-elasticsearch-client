{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'

module.exports =
class CatRecovery extends CatBaseCommand

  run: ({index}={}) ->
    if index is undefined
      return showIndicesListView((item) ->
        new CatRecovery(index: item.name)
      )

    responseView = @getResponseView(title: "Recovery: #{index}")

    @client.cat.recovery(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
