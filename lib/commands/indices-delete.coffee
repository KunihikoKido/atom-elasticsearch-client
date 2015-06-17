{DeleteCommand} = require './base'

module.exports =
class IndicesDelete extends DeleteCommand

  run: ->
    options =
      index: @index

    @client.indices.delete(options, @showResult)
