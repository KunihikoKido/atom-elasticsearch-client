{CreateCommand} = require './base'
notifications = require '../notifications'
config = require '../config'


expandAction = (doc) ->
  action = {index: {}}
  for key in ["_parent", "_percolate", "_routing", "_timestamp",
    "_ttl", "_type", "_version", "_version_type", "_id",
    "_retry_on_conflict"]

    if key in Object.keys(doc)
      action.index[key] = doc[key]
  return action

helperReindex = () ->
  client = config.getClient()
  index = config.getIndex()
  scroll = "5m"

  success = 0

  client.search(index: index, searchType: "scan", scroll: scroll).
  then((response) ->
    return response._scroll_id
  ).
  catch((error) ->
    console.log(error)
    throw error
  ).
  then((scrollId) ->
    # first scroll
    return client.scroll(scrollId: scrollId, scroll: scroll)
  ).
  catch((error) ->
    console.log(error)
    throw error
  ).
  then(scanAndBulkIndex = (response) ->
    scrollId = response._scroll_id
    docs = response.hits.hits

    if docs.length is 0 or not scrollId
      return

    # Bulk index
    actions = []
    for doc in docs
      actions.push(expandAction(doc))
      actions.push(doc._source)

    client.bulk(index: index, body: actions).
    then((response) ->
      success += response.items.length
      console.log(success)

      # re-scroll
      client.scroll(scrollId: scrollId, scroll: scroll).
      then(scanAndBulkIndex).
      catch((error) ->
        console.log(error)
        throw error
      )
    ).
    catch((error) ->
      console.log(error)
      throw error
    )
  ).
  then(() ->
    console.log("finished reindex! #{success}")
    notifications.addSuccess("Finished Reindex! #{index}: #{success} documents")
  ).
  catch((error) ->
    console.log(error)
    notifications.addError("Reindex Error: #{error}")
  )

module.exports = helperReindex
