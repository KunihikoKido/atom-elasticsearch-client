request = require 'request'

module.exports =
class ElasticsearchClientView
  constructor: ->
    index = atom.config.get('elasticsearch-client.index')
    docType = atom.config.get('elasticsearch-client.docType')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-aliases",                 => @cat('aliases')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-allocation",              => @cat('allocation')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-count",                   => @cat('count')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-fielddata",               => @cat('fielddata')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-health",                  => @cat('health')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-indices",                 => @cat('indices')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-master",                  => @cat('master')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-nodes",                   => @cat('nodes')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-pending-tasks",           => @cat('pending_tasks')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-plugins",                 => @cat('plugins')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-recovery",                => @cat('recovery')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-segments",                => @cat('segments')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-shards",                  => @cat('shards')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-thread-pool",             => @cat('thread_pool')
    atom.commands.add 'atom-workspace', "elasticsearch-client:docs-index-document",         => @indexDocument(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-cjk",         => @analyze(index, 'cjk')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-default",     => @analyze(index, 'default')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-english",     => @analyze(index, 'english')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-keyword",     => @analyze(index, 'keyword')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-pattern",     => @analyze(index, 'pattern')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-simple",      => @analyze(index, 'simple')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-snowball",    => @analyze(index, 'snowball')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-standard",    => @analyze(index, 'standard')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-stop",        => @analyze(index, 'stop')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-whitespace",  => @analyze(index, 'whitespace')
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-create-index",        => @createIndex(index)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-delete-index",        => @deleteIndex(index)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-delete-mapping",      => @deleteMapping(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-get-mapping",         => @getMapping(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-get-index-settings",  => @getIndexSettings(index)
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-put-mapping",         => @putMapping(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-request-body-search",  => @requestBodySearch(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-search-template",      => @searchTemplate(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-validate-query",       => @validateQuery(index, docType)
    atom.commands.add 'atom-workspace', "elasticsearch-client:server-info",                 => @serverInfo()


  getText: ->
    editor = atom.workspace.getActivePaneItem()
    body = editor.getText()

  makePath: (parts...) ->
    parts = (part for part in parts when part)
    parts.join('/')

  resultJson: (error, response, body) ->
    atom.workspace.open("Response", split: 'right').done () ->
      editor = atom.workspace.getActivePaneItem()
      editor.setGrammar(atom.grammars.grammarForScopeName('source.json'))
      editor.setText(body)

  resultText: (error, response, body) ->
    atom.workspace.open("Response", split: 'right').done () ->
      editor = atom.workspace.getActivePaneItem()
      editor.setGrammar(atom.grammars.grammarForScopeName('text.plain'))
      editor.setText(body)

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

  POST: (path, params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'POST'
      path: path
      params: params
      body: @getText()

    @request(options, callback)


  PUT: (path, params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'PUT'
      path: path
      params: params
      body: @getText()

    @request(options, callback)

  DELETE: (path, params={pretty: true}, isResutJson=true) ->
    callback = if isResutJson then @resultJson else @resultText
    options =
      method: 'DELETE'
      path: path
      params: params
    @request(options, callback)

  # info
  serverInfo: ->
    @GET('/')

  # Cat APIs
  cat: (param) ->
    @GET(@makePath('_cat', param), params={v: true}, isResutJson=false)

  # Document APIs
  indexDocument: (index, docType)->
    @POST(@makePath(index, docType))

  # Indices APIs
  analyze: (index, analyzer) ->
    @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: analyzer})

  createIndex: (index) ->
    @PUT(@makePath(index))

  getIndexSettings: (index) ->
    @GET(@makePath(index, '_settings'))

  deleteIndex: (index) ->
    @DELETE(@makePath(index))

  putMapping: (index, docType) ->
    @PUT(@makePath(index, '_mapping', docType))

  getMapping: (index, docType) ->
    atom.notifications.addInfo('foo!#{index}')
    @GET(@makePath(index, '_mapping', docType))

  deleteMapping: (index, docType) ->
    @DELETE(@makePath(index, '_mapping', docType))

  # Search APIs
  requestBodySearch: (index, docType) ->
    @POST(@makePath(index, docType, '_search'))

  searchTemplate: (index, docType) ->
    @POST(@makePath(index, docType, '_search', 'template'))

  validateQuery: (index, docType) ->
    @POST(@makePath(index, docType, '_validate', 'query'), params={pretty: true, explain: true})
