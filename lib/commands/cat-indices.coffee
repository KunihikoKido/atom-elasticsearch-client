{CatBaseCommand} = require './base'

module.exports =
class CatIndices extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.indices(options, @showResult)
