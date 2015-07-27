{BaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
config = require '../config'
SelectDocType = require './select-doc-type'

module.exports =
class SelectIndex extends BaseCommand

  isEnabled: ->
    return true

  run: ({index, docType}={}) ->
    if not index
      options =
        all: false
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new SelectIndex(index: item.index)
      )

    config.setActiveServer(index: index)

    new SelectDocType()
