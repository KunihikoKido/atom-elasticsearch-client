{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
InputView = require '../views/input-view'


module.exports =
  class HelperChangeNumberOfReplicas extends CreateCommand

    isEnabled: ->
      return true

    run: ({index, replicas}={}) ->
      if not index
        options =
          all: false
          defaultIndex: @index
        return showIndicesListView(@client, options, (item) ->
          new HelperChangeNumberOfReplicas(index: item.index)
        )

      if not replicas
        return new InputView(
          'Required: change the number of replicas.',
          (value) ->
            new HelperChangeNumberOfReplicas(index: index, replicas: value)
        )

      options =
        index: index
        body: {
          "index": {
            "number_of_replicas": replicas
          }
        }

      @client.indices.putSettings(options, @showResult)
