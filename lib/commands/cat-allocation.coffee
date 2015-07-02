{CatBaseCommand} = require './base'
{showNodesListView} = require '../views/nodes-list-view'

module.exports =
class CatAllocation extends CatBaseCommand

  run: ({nodeId}={})->
    if nodeId is undefined
      return showNodesListView(@client, (item) ->
        new CatAllocation(nodeId: item.name)
      )

    responseView = @getResponseView(title: "Allocation: #{nodeId}")

    @client.cat.allocation(v: true, nodeId: nodeId).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
