{BaseCommand} = require './base'
{showAnalyzerListView} = require '../views/analyzer-list-view'

module.exports =
class IndicesAnalyze extends BaseCommand

  run: ({analyzer}={})->
    if not analyzer
      return showAnalyzerListView(@client, index: @index, (item) ->
        new IndicesAnalyze(analyzer: item.analyzer)
      )

    options =
      analyzer: analyzer
      index: @index
      body: @getText()

    @client.indices.analyze(options, @showResult)
