{BaseCommand} = require './base'
{showSearchTemplateListView} = require '../views/search-template-list-view'


module.exports =
class GetSearchTemplate extends BaseCommand

  run: ({id}={}) ->
    if not id
      return showSearchTemplateListView(@client, (item) ->
        new GetSearchTemplate(id: item.template)
      )

    options =
      id: id

    @client.getTemplate(options, @showResult)
