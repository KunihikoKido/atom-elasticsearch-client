{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class ExplainDocument extends BaseCommand

  run: ({id}={})->
    if not id
      return new InputView(
        'Required: document id to explain',
        (value) -> new ExplainDocument(id: value))

    options =
      index: @index
      type: @docType
      body: @getText()
      id: id

    @client.explain(options, @showResult)
