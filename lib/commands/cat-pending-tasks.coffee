{CatBaseCommand} = require './base'

module.exports =
class CatPendingTasks extends CatBaseCommand

  run: ->
    options =
      v: true

    @client.cat.pendingTasks(options, @showResult)
