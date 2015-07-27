{BaseCommand} = require './base'
{showDocTypeListView} = require '../views/doc-type-list-view'
config = require '../config'
showActiveServer = require './show-active-server'

module.exports =
class SelectDocType extends BaseCommand

  isEnabled: ->
    return true

  run: ({docType}={}) ->
    if not docType
      return showDocTypeListView(@client, index: @index, (item) ->
        new SelectDocType(docType: item.docType)
      )

    config.setActiveServer(docType: docType)
    new showActiveServer()
