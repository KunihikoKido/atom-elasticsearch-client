{DeleteCommand} = require './base'
{showIndicesTemplateListView} = require '../views/indices-template-list-view'
dialog = require '../dialog'


module.exports =
class IndicesDeleteTemplate extends DeleteCommand

  isEnabled: ->
    return true

  run: ({template}={}) ->
    if not template
      return showIndicesTemplateListView(@client, (item) ->
        new IndicesDeleteTemplate(template: item.template)
      )

    if dialog.okCancel("Are you sure you want to delete?\nTemplate : #{name}", okTitle: "Delete")
      @client.indices.deleteTemplate(name: template, @showResult)
