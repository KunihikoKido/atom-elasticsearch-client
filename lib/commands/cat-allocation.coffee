{CatBaseCommand} = require './base'

module.exports =
class CatAllocation extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.allocation(options, @showResult)
