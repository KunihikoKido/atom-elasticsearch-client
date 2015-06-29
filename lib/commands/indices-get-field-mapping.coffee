{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'
ListView = require '../views/list-view'


module.exports =
class IndicesGetFieldMapping extends BaseCommand

  run: ({field}={}) ->
    if not field
      index = @index
      docType = @docType
      @client.indices.getFieldMapping(index: index, type: docType, field: "*").
      then((response) ->
        fields = Object.keys(response[index]["mappings"][docType])
        fields.sort()
        items = []
        for field in fields
          items.push {name: "#{field}", field: field}
        return items
      ).
      then((items) ->
        new ListView(items,
          ({field}={}) -> new IndicesGetFieldMapping(field: field))
      )
      return

    options =
      index: @index
      type: @docType
      field: field

    @client.indices.getFieldMapping(options, @showResult)
