{BaseCommand} = require './base'
notifications = require '../notifications'

module.exports =
class ShowActiveServer extends BaseCommand

  run: ->
    @showActiveServer()
