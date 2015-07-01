{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'

module.exports =
class CatIndices extends CatBaseCommand

  run: ({index}={}) ->
    if index is undefined
      return showIndicesListView((item) ->
        new CatIndices(index: item.name)
      )

    responseView = @getResponseView(title: "Indices: #{index}")

    @client.cat.indices(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
