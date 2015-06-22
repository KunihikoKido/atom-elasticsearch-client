{CreateCommand} = require './base'

module.exports =
class IndicesUpdateAliases extends CreateCommand

  run: ->

    options =
      body: @getText()

    @client.indices.updateAliases(options, @showResult)
