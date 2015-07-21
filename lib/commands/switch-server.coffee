{BaseCommand} = require './base'
config = require '../config'
{showSwitchServerListView} = require '../views/switch-server-list-view'

module.exports =
class SwitchServer extends BaseCommand

  run: ({item}={})->
    if item is undefined
      return showSwitchServerListView((item) ->
        new SwitchServer(item: item)
      )

    config.setActiveServer(item)
    config.showActiveServer()
