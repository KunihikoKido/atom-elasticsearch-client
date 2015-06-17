{CatBaseCommand} = require './base'

module.exports =
class CatMaster extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.master(options, @showResult)
