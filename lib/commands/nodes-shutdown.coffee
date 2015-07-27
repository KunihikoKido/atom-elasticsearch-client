{DeleteCommand} = require './base'
dialog = require '../dialog'

module.exports =
class NodesShutdown extends DeleteCommand

  isEnabled: ->
    return true

  run: ({nodeId}={})->

    if dialog.okCancel("Are you sure you want to shutdown?\nNodeId: #{nodeId}", okTitle: "Shutdown")
      options =
        nodeId: nodeId

      @client.nodes.shutdown(options, @showResult)
