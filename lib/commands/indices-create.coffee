{CreateCommand} = require './base'
InputView = require '../views/input-view'

module.exports =
class IndicesCreate extends CreateCommand

  isEnabled: ->
    return true

  run: ({index}={})->
    if not index
      return new InputView(
        "Required: index name to create index.",
        (value) -> new IndicesCreate(index: value))

    options =
      index: index

    @client.indices.create(options, @showResult)
