{BaseCommand} = require './base'
{showDocTypeListView} = require '../views/doc-type-list-view'


module.exports =
class IndicesGetMapping extends BaseCommand

  run: ({docType}={}) ->
    if not docType
      return showDocTypeListView(@client, index: @index, (item) ->
        new IndicesGetMapping(docType: item.name)
      )

    options =
      index: @index
      type: @docType

    @client.indices.getMapping(options, @showResult)
