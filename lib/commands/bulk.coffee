InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class Bulk extends CreateCommand

  run: ->

    options =
      index: @index
      type: @docType
      body: @getText()

    @client.bulk(options, @showResult)
