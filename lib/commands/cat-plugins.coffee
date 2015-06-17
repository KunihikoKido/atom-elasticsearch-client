{CatBaseCommand} = require './base'

module.exports =
class CatPlugins extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.plugins(options, @showResult)
