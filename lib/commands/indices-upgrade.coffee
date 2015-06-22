{CreateCommand} = require './base'


module.exports =
class IndicesUpgrade extends CreateCommand

  run: ({name}={}) ->
    options =
      index: @index

    @client.indices.upgrade(options, @showResult)
