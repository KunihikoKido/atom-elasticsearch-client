{BaseCommand} = require './base'
ListView = require '../views/list-view'


module.exports =
class IndicesAnalyze extends BaseCommand

  items: ->
    items = DEFAULT_ANALYZERS.slice()

  onDone: (item) ->
    new IndicesAnalyze(item)

  run: ({items, analyzer}={})->
    if not analyzer
      return new ListView(@analyzers, @onDone)

    options =
      analyzer: analyzer
      index: @index
      text: @getText()

    @client.indices.analyze(options, @showResult)
