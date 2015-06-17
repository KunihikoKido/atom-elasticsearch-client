{CatBaseCommand} = require './base'

module.exports =
class CatCount extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.count(options, @showResult)
