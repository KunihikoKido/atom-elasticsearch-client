{BaseCommand} = require './base'
notifications = require '../notifications'
config = require '../config'

module.exports =
class ShowActiveServer extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    config.showActiveServer()
