{$$, SelectListView} = require 'atom-space-pen-views'
request = require 'request'


BUTTONS = ["Cancel", "OK"]
CANCELED = 0
OK = 1

confirmed = (message) ->
  answer = atom.confirm(message: "Are you sure you want #{message}?", buttons: BUTTONS)

class SwitchServerView extends SelectListView

  initialize: ->
    super
    @setServers()
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @focusFilterEditor()

  hide: ->
    @panel?.hide()

  setServers: ->
    servers = atom.config.get('elasticsearch-client.servers')
    items = []
    for {baseUrl, index, docType} in servers
      url = "#{baseUrl}/#{index}/#{docType}"
      items.push {url: url, baseUrl: baseUrl, index: index, docType: docType}
    @setItems(items)

  getFilterKey: -> 'url'

  viewForItem: ({baseUrl, index, docType}) ->
    $$ ->
      @li =>
        @div class: 'text-highlight', "#{baseUrl}/#{index}/#{docType}"

  confirmed: ({baseUrl, index, docType}) ->
   atom.config.set('elasticsearch-client.baseUrl', baseUrl)
   atom.config.set('elasticsearch-client.index', index)
   atom.config.set('elasticsearch-client.docType', docType)
   atom.notifications.addInfo("Switched: #{baseUrl}/#{index}/#{docType}")
   @hide()

  cancelled: -> @hide()



module.exports =
class ElasticsearchClientCommand
  constructor: ->
    atom.commands.add 'atom-workspace', "elasticsearch:cat-aliases",                 => @cat('aliases')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-allocation",              => @cat('allocation')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-count",                   => @cat('count')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-fielddata",               => @cat('fielddata')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-health",                  => @cat('health')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-indices",                 => @cat('indices')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-master",                  => @cat('master')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-nodes",                   => @cat('nodes')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-pending-tasks",           => @cat('pending_tasks')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-plugins",                 => @cat('plugins')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-recovery",                => @cat('recovery')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-segments",                => @cat('segments')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-shards",                  => @cat('shards')
    atom.commands.add 'atom-workspace', "elasticsearch:cat-thread-pool",             => @cat('thread_pool')
    atom.commands.add 'atom-workspace', "elasticsearch:docs-index-document",         => @indexDocument()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-cjk",         => @analyze('cjk')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-default",     => @analyze('default')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-english",     => @analyze('english')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-keyword",     => @analyze('keyword')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-pattern",     => @analyze('pattern')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-simple",      => @analyze('simple')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-snowball",    => @analyze('snowball')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-standard",    => @analyze('standard')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-stop",        => @analyze('stop')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-analyze-whitespace",  => @analyze('whitespace')
    atom.commands.add 'atom-workspace', "elasticsearch:indices-create-index",        => @createIndex()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-delete-index",        => if confirmed("delete index") is OK then @deleteIndex()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-delete-mapping",      => if confirmed("delete mapping") is OK then @deleteMapping()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-get-mapping",         => @getMapping()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-get-index-settings",  => @getIndexSettings()
    atom.commands.add 'atom-workspace', "elasticsearch:indices-put-mapping",         => @putMapping()
    atom.commands.add 'atom-workspace', "elasticsearch:search-request-body-search",  => @requestBodySearch()
    atom.commands.add 'atom-workspace', "elasticsearch:search-search-template",      => @searchTemplate()
    atom.commands.add 'atom-workspace', "elasticsearch:search-validate-query",       => @validateQuery()
    atom.commands.add 'atom-workspace', "elasticsearch:server-info",                 => @serverInfo()
    atom.commands.add 'atom-workspace', "elasticsearch:settings-show-active-server", => @showActiveServer()
    atom.commands.add 'atom-workspace', "elasticsearch:settings-switch-server",      => @switchServer()

  getBaseUrl: ->
    atom.config.get('elasticsearch-client.baseUrl')

  getIndex: ->
    atom.config.get('elasticsearch-client.index')

  getDocType: ->
    atom.config.get('elasticsearch-client.docType')

  getText: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    text = editor.getSelectedText() or editor.getText()

  makePath: (parts...) ->
    parts = (part for part in parts when part)
    parts.join('/')

  resultJson: (error, response, body) ->
    if error
      return atom.notifications.addError("Elasticsearch Server: #{error}")

    if typeof body is 'object'
      body = JSON.stringify(body, null, '\t')

    atom.workspace.open("Response", split: 'right').done () ->
      editor = atom.workspace.getActivePaneItem()
      editor.setGrammar(atom.grammars.grammarForScopeName('source.json'))
      editor.setText(body or '')


  resultText: (error, response, body) ->
    if error
      return atom.notifications.addError("Elasticsearch Server: #{error}")

    atom.workspace.open("Response", split: 'right').done () ->
      editor = atom.workspace.getActivePaneItem()
      editor.setGrammar(atom.grammars.grammarForScopeName('text.plain'))
      editor.setText(body or '')

  request: (options, callback) ->
    {method, path, body, params} = options

    baseUrl = atom.config.get('elasticsearch-client.baseUrl')
    headers = atom.config.get('elasticsearch-client.headers')

    options =
      method: method
      baseUrl: baseUrl
      uri: path
      qs: params
      body: body
      headers: headers

    console.log(options)
    request(options, callback)

  GET: (path, params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'GET'
      path: path
      params: params
    @request(options, callback)

  POST: (path, body='', params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'POST'
      path: path
      params: params
      body: body

    @request(options, callback)

  PUT: (path, body='', params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'PUT'
      path: path
      params: params
      body: body

    @request(options, callback)

  DELETE: (path, params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'DELETE'
      path: path
      params: params
    @request(options, callback)

  switchServer: ->
    switchServer = new SwitchServerView()

  showActiveServer: ->
    atom.notifications.addInfo("#{@getBaseUrl()}/#{@getIndex()}/#{@getDocType()}")

  # info
  serverInfo: ->
    @GET('/')

  # Cat APIs
  cat: (param) ->
    @GET(@makePath('_cat', param), params={v: true}, isResutJson=false)

  # Document APIs
  indexDocument: ->
    @POST(@makePath(@getIndex(), @getDocType()), body=@getText())

  # Indices APIs
  analyze: (analyzer) ->
    @POST(@makePath(@getIndex(), '_analyze'), body=@getText(), params={pretty: true, analyzer: analyzer})

  createIndex: ->
    @PUT(@makePath(@getIndex()))

  getIndexSettings: ->
    @GET(@makePath(@getIndex(), '_settings'))

  deleteIndex: ->
    @DELETE(@makePath(@getIndex()))

  putMapping: ->
    @PUT(@makePath(@getIndex(), '_mapping', @getDocType()), body=@getText())

  getMapping: ->
    @GET(@makePath(@getIndex(), '_mapping', @getDocType()))

  deleteMapping: ->
    @DELETE(@makePath(@getIndex(), '_mapping', @getDocType()))

  # Search APIs
  requestBodySearch: ->
    @POST(@makePath(@getIndex(), @getDocType(), '_search'), body=@getText())

  searchTemplate: ->
    @POST(@makePath(@getIndex(), @getDocType(), '_search', 'template'), body=@getText())

  validateQuery: ->
    @POST(@makePath(@getIndex(), @getDocType(), '_validate', 'query'), body=@getText(), params={pretty: true, explain: true})
