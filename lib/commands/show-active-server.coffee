{BaseCommand} = require './base'
notifications = require '../notifications'
config = require '../config'

module.exports =
class ShowActiveServer extends BaseCommand

  run: ->
    config.showActiveServer()
