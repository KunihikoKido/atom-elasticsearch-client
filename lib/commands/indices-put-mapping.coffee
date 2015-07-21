{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class IndicesPutMapping extends CreateCommand

  run: ({docType}={}) ->
    if not docType
      return new InputView(
        "Required: name to document type.",
        (value) -> new IndicesPutMapping(docType: value))

    options =
      index: @index
      type: docType
      body: @getText()

    @client.indices.putMapping(options, @showResult)
