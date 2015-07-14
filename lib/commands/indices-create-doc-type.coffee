{CreateCommand} = require './base'
InputView = require '../views/input-view'

module.exports =
class IndicesCreateDocType extends CreateCommand

  run: ({docType}={})->
    if not docType
      return new InputView(
        "Required: name to create document type.",
        (value) -> new IndicesCreateDocType(docType: value))

    options =
      index: @index
      type: docType
      body: {}
      
    options.body[docType] = {}

    @client.indices.putMapping(options, @showResult)
