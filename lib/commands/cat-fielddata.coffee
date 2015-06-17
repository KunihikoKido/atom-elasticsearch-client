{CatBaseCommand} = require './base'

module.exports =
class CatFielddata extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.fielddata(options, @showResult)
