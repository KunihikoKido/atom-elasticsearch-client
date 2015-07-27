{BaseCommand} = require './base'
{showSearchTemplateListView} = require '../views/search-template-list-view'


module.exports =
class GetSearchTemplate extends BaseCommand

  isEnabled: ->
    return true

  run: ({id}={}) ->
    if not id
      return showSearchTemplateListView(@client, (item) ->
        new GetSearchTemplate(id: item.id)
      )

    options =
      id: id

    @client.getTemplate(options, @showResult)
