{allowUnsafeNewFunction} = require 'loophole'
elasticsearch = allowUnsafeNewFunction -> require 'elasticsearch'
notifications = require './notifications'


module.exports =
  namespace: "elasticsearch-client"

  getBaseUrl: ->
    atom.config.get("#{@namespace}.baseUrl")

  getIndex: ->
    atom.config.get("#{@namespace}.index")

  getDocType: ->
    atom.config.get("#{@namespace}.docType")

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

  getClient: ({baseUrl, apiVersion}={}) ->
    options =
      host: @getBaseUrl()
      apiVersion: @getApiVersion()
      connectionClass: 'http'
      keepAlive: false

    if baseUrl
      options.hots = baseUrl
      options.apiVersion = apiVersion

    client = new elasticsearch.Client(options)


  setBaseUrl: (baseUrl) ->
    atom.config.set("#{@namespace}.baseUrl", baseUrl)

  setIndex: (index) ->
    atom.config.set("#{@namespace}.index", index)

  setDocType: (docType) ->
    atom.config.set("#{@namespace}.docType", docType)

  setApiVersion: (apiVersion) ->
    atom.config.set("#{@namespace}.apiVersion", apiVersion)

  setActiveServer: ({baseUrl, index, docType, apiVersion}={}) ->
    @setBaseUrl(baseUrl)
    @setIndex(index)
    @setDocType(docType)
    @setApiVersion(apiVersion)

  showActiveServer: ->
    notifications.addInfo("""
      baseUrl     :#{@getBaseUrl()}
      index       :#{@getIndex()}
      docType     :#{@getDocType()}
      apiVersion  :#{@getApiVersion()}
    """)
