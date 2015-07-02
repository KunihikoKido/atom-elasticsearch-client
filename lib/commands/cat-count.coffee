{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class CatCount extends CatBaseCommand

  run: ({index}={})->
    if index is undefined
      return showIndicesListView(@client, (item) ->
        new CatCount(index: item.index)
      )

    responseView = @getResponseView(title: "Count: #{index}")

    @client.cat.count(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
