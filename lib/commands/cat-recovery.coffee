{CatBaseCommand} = require './base'

module.exports =
class CatRecovery extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.recovery(options, @showResult)
