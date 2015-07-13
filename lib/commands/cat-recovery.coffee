{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'

module.exports =
class CatRecovery extends CatBaseCommand

  run: ({index}={}) ->
    if index is undefined
      options =
        all: true
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new CatRecovery(index: item.index)
      )

    responseView = @getResponseView(title: "Recovery: #{index}")

    @client.cat.recovery(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
