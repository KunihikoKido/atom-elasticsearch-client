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
    if baseUrl isnt undefined
      atom.config.set("#{@namespace}.baseUrl", baseUrl)

  setIndex: (index) ->
    if index isnt undefined
      atom.config.set("#{@namespace}.index", index)

  setDocType: (docType) ->
    if docType isnt undefined
      atom.config.set("#{@namespace}.docType", docType)

  setApiVersion: (apiVersion) ->
    if apiVersion isnt undefined
      atom.config.set("#{@namespace}.apiVersion", apiVersion)

  setMaxRetries: (maxRetries) ->
    if maxRetries isnt undefined
      atom.config.set("#{@namespace}.maxRetries", maxRetries)

  setRequestTimeout: (requestTimeout) ->
    if requestTimeout isnt undefined
      atom.config.set("#{@namespace}.requestTimeout", requestTimeout)

  setDeadTimeout: (deadTimeout) ->
    if deadTimeout isnt undefined
      atom.config.set("#{@namespace}.deadTimeout", deadTimeout)

  setPingTimeout: (pingTimeout) ->
    if pingTimeout isnt undefined
      atom.config.set("#{@namespace}.pingTimeout", pingTimeout)

  setKeepAlive: (keepAlive) ->
    if keepAlive isnt undefined
      atom.config.set("#{@namespace}.keepAlive", keepAlive)

  setAuthorizationHeader: (authorizationHeader) ->
    if authorizationHeader isnt undefined
      atom.config.set("#{@namespace}.authorizationHeader", authorizationHeader)

  setUserAgent: (userAgent) ->
    if userAgent isnt undefined
      atom.config.set("#{@namespace}.userAgent", userAgent)

  setScrollSize: (scrollSize) ->
    if scrollSize isnt undefined
      atom.config.set("#{@namespace}.scrollSize", scrollSize)

  setActiveServer: (settings) ->
    @setBaseUrl(settings.baseUrl)
    @setIndex(settings.index)
    @setDocType(settings.docType)
    @setApiVersion(settings.apiVersion)
    @setMaxRetries(settings.maxRetries)
    @setRequestTimeout(settings.requestTimeout)
    @setDeadTimeout(settings.deadTimeout)
    @setPingTimeout(settings.pingTimeout)
    @setKeepAlive(settings.keepAlive)
    @setAuthorizationHeader(settings.authorizationHeader)
    @setUserAgent(settings.userAgent)
    @setScrollSize(settings.scrollSize)

    @client = @initClient()

  showActiveServer: ->
    notifications.addInfo("""
      baseUrl     :#{@getBaseUrl()}
      index       :#{@getIndex()}
      docType     :#{@getDocType()}
      apiVersion  :#{@getApiVersion()}
    """)
