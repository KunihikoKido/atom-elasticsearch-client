{BaseCommand} = require './base'

module.exports =
class SearchShards extends BaseCommand

  run: ->
    options =
      index: @index

    @client.searchShards(options, @showResult)
