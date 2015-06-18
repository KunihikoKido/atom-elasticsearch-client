{DeleteCommand} = require './base'
dialog = require '../dialog'


module.exports =
class IndicesDeleteMapping extends DeleteCommand

  run: ->
    if dialog.okCancel("Are you sure you want to delete?\nMapping: #{@index}/#{@docType}", okTitle: "Delete")
      options =
        index: @index
        type: @docType

      @client.indices.deleteMapping(options, @showResult)
