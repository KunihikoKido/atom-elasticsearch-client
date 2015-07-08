{CreateCommand} = require './base'
{showIndicesListView} = require '../views/indices-list-view'
notifications = require '../notifications'
dialog = require '../dialog'
LoadingView = require '../views/loading-view'


expandAction = (doc) ->
  action = {index: {}}
  for key in ["_parent", "_percolate", "_routing", "_timestamp",
    "_ttl", "_type", "_version", "_version_type", "_id",
    "_retry_on_conflict"]

    if key in Object.keys(doc)
      action.index[key] = doc[key]
  return action


module.exports =
class HelperReindex extends CreateCommand

  reindex: (client, index, {scroll}={}) ->
    lodingView = new LoadingView()
    success = 0

    client.search(index: index, searchType: "scan", scroll: scroll).
    then((response) ->
      return response._scroll_id
    ).
    catch((error) ->
      throw error
    ).
    then((scrollId) ->
      # first scroll
      return client.scroll(scrollId: scrollId, scroll: scroll)
    ).
    catch((error) ->
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
        lodingView.updateMessage("Reindexing #{index} ... #{success} docs.")

        # re-scroll
        client.scroll(scrollId: scrollId, scroll: scroll).
        then(scanAndBulkIndex).
        catch((error) ->
          throw error
        )
      ).
      catch((error) ->
        throw error
      )
    ).
    catch((error) ->
      notifications.addError("Reindex Error: #{error}", dismissable: true)
    ).
    then(()->
      console.log("Finished #{index} reindex: #{success}")
      lodingView.updateMessage("Finished reindexing for #{index}: #{success} docs.")
      lodingView.finish()
    )


  run: ({index}={})->
    if not index
      return showIndicesListView(@client, all: false, (item) ->
        new HelperReindex(index: item.index)
      )

    if not dialog.okCancel("Are you sure you want to reindex?\nIndex: #{index}", okTitle: "Reindex")
      return # canceled

    @reindex(@client, index, scroll: @scroll)
