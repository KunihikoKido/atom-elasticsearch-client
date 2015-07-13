{CatBaseCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'

module.exports =
class CatSegments extends CatBaseCommand

  run: ({index}={}) ->
    if index is undefined
      options =
        all: true
        defaultIndex: @index
      return showIndicesListView(@client, options, (item) ->
        new CatSegments(index: item.index)
      )

    responseView = @getResponseView(title: "Segments: #{index}")

    @client.cat.segments(v: true, index: index).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
