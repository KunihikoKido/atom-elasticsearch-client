url = require 'url'
{allowUnsafeNewFunction} = require 'loophole'
elasticsearch = allowUnsafeNewFunction -> require 'elasticsearch'
notifications = require './notifications'


module.exports =
  namespace: "elasticsearch-client"
  client: null

  getBaseUrl: ->
    atom.config.get("#{@namespace}.baseUrl")

  getIndex: ->
    atom.config.get("#{@namespace}.index")

  getDocType: ->
    atom.config.get("#{@namespace}.docType")

  getScrollSize: ->
    atom.config.get("#{@namespace}.scrollSize")

  getApiVersion: ->
    atom.config.get("#{@namespace}.apiVersion")

  getServers: ->
    atom.config.get("#{@namespace}.servers")

  getCustomAnalyzers: ->
    atom.config.get("#{@namespace}.customAnalyzers")

  getOpenInPane: ->
    atom.config.get("#{@namespace}.openInPane")

  getSplitPane: ->
    atom.config.get("#{@namespace}.splitPane")

  getActivServer: ->
    activeServer =
      baseUrl: @getBaseUrl()
      index: @getIndex()
      docType: @getDocType()
      apiVersion: @getApiVersion()

  initClient: ->

    hostOptions = {}
    host = url.parse(@getBaseUrl())
    hostOptions.host    = host.hostname
    hostOptions.port    = host.port ?= "80"
    hostOptions.path    = host.path
    hostOptions.headers = {}
    hostOptions.headers["Authorization"] =
      atom.config.get("#{@namespace}.authorizationHeader")
    hostOptions.headers["User-Agent"] =
      atom.config.get("#{@namespace}".userAgent)

    options = {}
    options.host            = hostOptions
    options.apiVersion      = @getApiVersion()
    options.connectionClass = 'http'
    options.maxRetries      = atom.config.get("#{@namespace}.maxRetries")
    options.requestTimeout  = atom.config.get("#{@namespace}.requestTimeout")
    options.deadTimeout     = atom.config.get("#{@namespace}.deadTimeout")
    options.pingTimeout     = atom.config.get("#{@namespace}.pingTimeout")
    options.keepAlive       = atom.config.get("#{@namespace}.keepAlive")

    console.log(hostOptions)

    new elasticsearch.Client(options)

  getClient: ->
    @client ?= @initClient()

  setBaseUrl: (baseUrl) ->
    if baseUrl
      atom.config.set("#{@namespace}.baseUrl", baseUrl)

  setIndex: (index) ->
    if index
      atom.config.set("#{@namespace}.index", index)

  setDocType: (docType) ->
    if docType
      atom.config.set("#{@namespace}.docType", docType)

  setApiVersion: (apiVersion) ->
    if apiVersion
      atom.config.set("#{@namespace}.apiVersion", apiVersion)

  setActiveServer: ({baseUrl, index, docType, apiVersion}={}) ->
    @setBaseUrl(baseUrl)
    @setIndex(index)
    @setDocType(docType)
    @setApiVersion(apiVersion)
    @client = @initClient()

  showActiveServer: ->
    notifications.addInfo("""
      baseUrl     :#{@getBaseUrl()}
      index       :#{@getIndex()}
      docType     :#{@getDocType()}
      apiVersion  :#{@getApiVersion()}
    """)
