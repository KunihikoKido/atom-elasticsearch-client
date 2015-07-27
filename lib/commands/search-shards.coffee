{BaseCommand} = require './base'

module.exports =
class SearchShards extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    options =
      index: @index

    @client.searchShards(options, @showResult)
