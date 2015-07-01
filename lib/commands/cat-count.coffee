{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class CatCount extends CatBaseCommand

  run: ({index}={})->
    if index is undefined
      return showIndicesListView((item) ->
        new CatCount(index: item.name)
      )

    responseView = @getResponseView(title: "Count: #{index}")

    @client.cat.count(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
