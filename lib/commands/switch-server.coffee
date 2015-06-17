{BaseCommand} = require './base'
ListView = require '../views/list-view'


module.exports =
class SwitchServer extends BaseCommand

  items: ->
    items = []
    for item in @getServers()
      item.name = "#{item.baseUrl}/#{item.index}/#{item.docType}"
      items.push(item)
    items

  run: (item) ->
    if not item
      return new ListView(@items(), (item) -> new SwitchServer(item))

    @setActiveServer(item)
    @showActiveServer()
