{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'


module.exports =
class CatShards extends CatBaseCommand

  run: ({index}={}) ->
    if index is undefined
      return showIndicesListView(@client, all: true, (item) ->
        new CatShards(index: item.index)
      )

    responseView = @getResponseView(title: "Shards: #{index}")

    @client.cat.shards(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
