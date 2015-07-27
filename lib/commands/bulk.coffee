InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class Bulk extends CreateCommand
  syntaxErrorMessage: "Syntax error: content length is 0 byte"

  isEnabled: ->
    text = @getText()
    if text.length is 0
      return false
    return true

  run: ->

    options =
      index: @index
      type: @docType
      body: @getText()

    @client.bulk(options, @showResult)
