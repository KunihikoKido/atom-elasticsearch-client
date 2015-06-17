{CatBaseCommand} = require './base'

module.exports =
class CatThreadPool extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.threadPool(options, @showResult)
