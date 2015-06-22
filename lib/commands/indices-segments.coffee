{BaseCommand} = require './base'

module.exports =
class IndicesSegments extends BaseCommand

  run: ->
    options =
      human: true
      index: @index

    @client.indices.segments(options, @showResult)
