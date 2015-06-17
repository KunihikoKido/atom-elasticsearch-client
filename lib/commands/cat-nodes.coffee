{CatBaseCommand} = require './base'

module.exports =
class CatNodes extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.nodes(options, @showResult)
