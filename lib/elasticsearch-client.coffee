request = require 'request'

module.exports =
  config:
    baseUrl:
      type: 'string'
      default: 'http://localhost:9200'
    index:
      type: 'string'
      default: 'blog'
    docType:
      type: 'string'
      default: 'posts'

  activate: ->
    index = atom.config.get('elasticsearch-client.index')
    docType = atom.config.get('elasticsearch-client.docType')
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-aliases",         => @GET(@makePath('_cat', 'aliases'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-allocation",      => @GET(@makePath('_cat', 'allocation'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-count",           => @GET(@makePath('_cat', 'count'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-fielddata",       => @GET(@makePath('_cat', 'fielddata'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-health",          => @GET(@makePath('_cat', 'health'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-indices",         => @GET(@makePath('_cat', 'indices'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-master",          => @GET(@makePath('_cat', 'master'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-nodes",           => @GET(@makePath('_cat', 'nodes'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-pending-tasks",   => @GET(@makePath('_cat', 'pending_tasks'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-plugins",         => @GET(@makePath('_cat', 'plugins'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-recovery",        => @GET(@makePath('_cat', 'recovery'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-segments",        => @GET(@makePath('_cat', 'segments'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-shards",          => @GET(@makePath('_cat', 'shards'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:cat-thread-pool",     => @GET(@makePath('_cat', 'thread_pool'), params={v: true}, isResutJson=false)
    atom.commands.add 'atom-workspace', "elasticsearch-client:docs-index-document",        => @POST(@makePath(index, docType))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-cjk",        => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'cjk'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-default",    => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'default'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-english",    => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'english'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-keyword",    => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'keyword'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-pattern",    => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'pattern'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-simple",     => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'simple'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-snowball",   => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'snowball'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-standard",   => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'standard'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-stop",       => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'stop'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-analyze-whitespace", => @POST(@makePath(index, '_analyze'), params={pretty: true, analyzer: 'whitespace'})
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-create-index",       => @PUT(@makePath(index))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-delete-index",       => @DELETE(@makePath(index))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-delete-mapping",     => @DELETE(@makePath(index, '_mapping', docType))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-get-mapping",        => @GET(@makePath(index, '_mapping', docType))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-get-settings",       => @GET(@makePath(index, '_settings'))
    atom.commands.add 'atom-workspace', "elasticsearch-client:indices-put-mapping",        => @PUT(@makePath(index, '_mapping', docType))
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-request-body-search", => @POST(@makePath(index, docType, '_search'))
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-search-template",     => @POST(@makePath(index, docType, '_search', 'template'))
    atom.commands.add 'atom-workspace', "elasticsearch-client:search-validate-query",      => @POST(@makePath(index, docType, '_validate', 'query'), params={pretty: true, explain: true})
    atom.commands.add 'atom-workspace', "elasticsearch-client:server-info",                => @GET('/')

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
