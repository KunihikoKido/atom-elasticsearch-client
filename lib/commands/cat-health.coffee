{CatBaseCommand} = require './base'

module.exports =
class CatHealth extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.health(options, @showResult)
