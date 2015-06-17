{CatBaseCommand} = require './base'

module.exports =
class CatAliases extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.aliases(options, @showResult)
