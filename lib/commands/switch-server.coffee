{BaseCommand} = require './base'
ListView = require '../views/list-view'
config = require '../config'


module.exports =
class SwitchServer extends BaseCommand

  items: ->
    items = []
    for item in config.getServers()
      item.name = "#{item.baseUrl}/#{item.index}/#{item.docType}"
      items.push(item)
    items

  setActiveServer: (item) ->
    config.setActiveServer(item)
    config.showActiveServer()

  run: ->
    new ListView(@items(), @setActiveServer)
