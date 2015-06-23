{DeleteCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class DeleteByQueryWithSimpleQuery extends DeleteCommand

  run: ({query}={})->

    if not query
        return new InputView(
          'Required: Query in the Lucene query string syntax',
          (value) -> new DeleteByQueryWithSimpleQuery(query: value))

    options =
      index: @index
      type: @docType
      q: query

    if dialog.okCancel("Are you sure you want to delete?\nQuery: #{query}", okTitle: "Delete")
      @client.deleteByQuery(options, @showResult)
