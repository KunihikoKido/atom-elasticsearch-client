dialog = require '../dialog'
notifications = require '../notifications'
config = require '../config'



helperCloseOpenIndex = () ->
  client = config.getClient()
  index = config.getIndex()

  client.indices.close(index: index).
  then((response) ->
    client.indices.open(index: index).
    catch((error) ->
      throw error
    )
  ).
  then((response) ->
    notifications.addSuccess("Success")
  ).
  catch((error) ->
    notifications.addError("Error: #{error}", dismissable: true)
  )


module.exports = helperCloseOpenIndex
