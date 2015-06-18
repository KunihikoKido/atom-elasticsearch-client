{DeleteCommand} = require './base'
dialog = require '../dialog'


module.exports =
class IndicesDelete extends DeleteCommand

  run: ->
    if dialog.okCancel("Are you sure you want to delete?\nIndex: #{@index}", okTitle: "Delete")
      options =
        index: @index

      @client.indices.delete(options, @showResult)
