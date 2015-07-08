{$$} = require 'atom-space-pen-views'
ListView = require './list-view'
config = require '../config'
notifications = require '../notifications'


class RepositoryListView extends ListView

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-repo', "#{item.name} (#{item.type})"


showRepositoryListView = (client, callback) ->

  client.snapshot.getRepository().
  then((response) ->
    items = []
    for repository, data of response
      items.push({
        name: "#{repository}",
        repository: repository,
        type: data.type,
        settings: data.settings
      })

    return new RepositoryListView(items, callback)
  ).
  catch((error) ->
    notifications.addError(error)
  )


module.exports.showRepositoryListView = showRepositoryListView
