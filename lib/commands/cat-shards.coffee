{CatBaseCommand} = require './base'


module.exports =
class CatShards extends CatBaseCommand

  run: ->
    responseView = @getResponseView(title: "Shards")

    @client.cat.shards(v: true).
    then((response) ->
      responseView.updateMessage(response)
    ).
    catch((error) ->
      responseView.updateMessage(error)
    )
