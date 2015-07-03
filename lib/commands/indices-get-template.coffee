{BaseCommand} = require './base'
{showIndicesTemplateListView} = require '../views/indices-template-list-view'


module.exports =
class IndicesGetTemplate extends BaseCommand

  run: ({template}={}) ->
    if not template
      return showIndicesTemplateListView(@client, (item) ->
        new IndicesGetTemplate(template: item.template)
      )

    @client.indices.getTemplate(name: template, @showResult)
