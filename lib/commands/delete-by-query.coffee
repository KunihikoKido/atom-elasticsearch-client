{DeleteCommand} = require './base'
dialog = require '../dialog'


module.exports =
class DeleteByQuery extends DeleteCommand

  run: ->
    query = @getText()
    options =
      index: @index
      type: @docType
      body: query

    if dialog.okCancel("Are you sure you want to delete?\nQuery: #{query}", okTitle: "Delete")
      @client.deleteByQuery(options, @showResult)
