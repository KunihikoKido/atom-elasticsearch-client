{CreateCommand} = require './base'

module.exports =
class IndexDocument extends CreateCommand

  run: ({id}={}) ->
    options =
      index: @index
      type: @docType
      body: @getText()

    options.id = id if id

    @client.index(options, @showResult)
