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

  onDone: (item) ->
    new SwitchServer(item)

  run: (item) ->
    if not item
      return new ListView(@items(), @onDone)

    @setActiveServer(item)
    @showActiveServer()
