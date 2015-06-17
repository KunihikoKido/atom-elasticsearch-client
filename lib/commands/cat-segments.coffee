{CatBaseCommand} = require './base'

module.exports =
class CatSegments extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.segments(options, @showResult)
