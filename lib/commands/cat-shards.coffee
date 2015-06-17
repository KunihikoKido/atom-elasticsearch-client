{CatBaseCommand} = require './base'

module.exports =
class CatShards extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.shards(options, @showResult)
