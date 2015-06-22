CatAliases            = require './commands/cat-aliases'
CatAllocation         = require './commands/cat-allocation'
CatCount              = require './commands/cat-count'
CatFielddata          = require './commands/cat-fielddata'
CatHealth             = require './commands/cat-health'
CatIndices            = require './commands/cat-indices'
CatMaster             = require './commands/cat-master'
CatNodes              = require './commands/cat-nodes'
CatPendingTasks       = require './commands/cat-pending-tasks'
CatPlugins            = require './commands/cat-plugins'
CatRecovery           = require './commands/cat-recovery'
CatSegments           = require './commands/cat-segments'
CatShards             = require './commands/cat-shards'
CatThreadPool         = require './commands/cat-thread-pool'

ClusterGetSettings    = require './commands/cluster-get-settings'
ClusterHealth         = require './commands/cluster-health'
ClusterPendingTasks   = require './commands/cluster-pending-tasks'
ClusterPutSettings    = require './commands/cluster-put-settings'
ClusterReroute        = require './commands/cluster-reroute'
ClusterState          = require './commands/cluster-state'
ClusterStats          = require './commands/cluster-stats'

IndicesAnalyze        = require './commands/indices-analyze'
IndicesClearCache     = require './commands/indices-clear-cache'
IndicesCreate         = require './commands/indices-create'
IndicesDelete         = require './commands/indices-delete'
IndicesDeleteAlias    = require './commands/indices-delete-alias'
IndicesDeleteMapping  = require './commands/indices-delete-mapping'
IndicesGetMapping     = require './commands/indices-get-mapping'
IndicesGetSettings    = require './commands/indices-get-settings'
IndicesPutMapping     = require './commands/indices-put-mapping'
IndicesPutSettings    = require './commands/indices-put-settings'
IndicesRecovery       = require './commands/indices-recovery'
IndicesStats          = require './commands/indices-stats'

Bulk                  = require './commands/bulk'
ClearScroll           = require './commands/clear-scroll'
Count                 = require './commands/count'
DeleteDocument        = require './commands/delete-document'
GetDocument           = require './commands/get-document'
IndexDocument         = require './commands/index-document'
Info                  = require './commands/info'
RequestBodySearch     = require './commands/request-body-search'
SearchTemplate        = require './commands/search-template'
ValidateQuery         = require './commands/validate-query'

ShowActiveServer      = require './commands/show-active-server'
SwitchServer          = require './commands/switch-server'


module.exports =
  config:
    baseUrl:
      type: 'string'
      default: 'http://localhost:9200'
      description: 'Elasticsearch server endpoint url'
    index:
      type: 'string'
      default: 'blog'
      description: 'Elasticsearch index for items'
    docType:
      type: 'string'
      default: 'posts'
      description: 'Elasticsearch document type for items'
    apiVersion:
      type: 'string'
      default: '1.6'
      description: 'Change the API that they client provides,
      specify the major version of the Elasticsearch nodes
      you will be connecting to.'
    servers:
      type: 'array'
      default: []
    customAnalyzers:
      type: 'array'
      default: []
      description: 'Analyze command to use analyzers'
    openInPane:
      type: 'boolean'
      default: true
      description: 'Allow commands to open new panes'
    splitPane:
      title: 'Split pane direction (up, right, down, or left)'
      type: 'string'
      default: 'right'
      description: 'Where should new panes go? (Defaults to right)'
    maxRetries:
      type: 'integer'
      default: 3
      description: 'How many times should the client try to connect to
      other nodes before returning a ConnectionFault error.'
    requestTimeout:
      type: 'integer'
      default: 30000
      description: 'Milliseconds before an HTTP request will be aborted
      and retried. This can also be set per request.'
    deadTimeout:
      type: 'integer'
      default: 30000
      description: 'Milliseconds that a dead connection will wait
      before attempting to revive itself.'
    pingTimeout:
      type: 'integer'
      default: 3000
      description: 'Milliseconds that a ping request can take before
      timing out.'
    keepAlive:
      type: 'boolean'
      default: true
      description: 'Should the connections to the node be kept open forever?
      This behavior is recommended when you are connecting directly
      to Elasticsearch.'
    authorizationHeader:
      type: 'string'
      default: ''
      description: ''
    userAgent:
      type: 'string'
      default: 'elasticsearch-client'

  activate: ->
    atom.commands.add 'atom-workspace',
      'elasticsearch:cat-aliases':               -> new CatAliases()
      'elasticsearch:cat-allocation':            -> new CatAllocation()
      'elasticsearch:cat-count':                 -> new CatCount()
      'elasticsearch:cat-fielddata':             -> new CatFielddata()
      'elasticsearch:cat-health':                -> new CatHealth()
      'elasticsearch:cat-indices':               -> new CatIndices()
      'elasticsearch:cat-master':                -> new CatMaster()
      'elasticsearch:cat-nodes':                 -> new CatNodes()
      'elasticsearch:cat-pending-tasks':         -> new CatPendingTasks()
      'elasticsearch:cat-plugins':               -> new CatPlugins()
      'elasticsearch:cat-recovery':              -> new CatRecovery()
      'elasticsearch:cat-segments':              -> new CatSegments()
      'elasticsearch:cat-shards':                -> new CatShards()
      'elasticsearch:cat-thread-pool':           -> new CatThreadPool()

      'elasticsearch:cluster-get-settings':      -> new ClusterGetSettings()
      'elasticsearch:cluster-health':            -> new ClusterHealth()
      'elasticsearch:cluster-pending-tasks':     -> new ClusterPendingTasks()
      'elasticsearch:cluster-put-settings':      -> new ClusterPutSettings()
      'elasticsearch:cluster-reroute':           -> new ClusterReroute()
      'elasticsearch:cluster-state':             -> new ClusterState()
      'elasticsearch:cluster-stats':             -> new ClusterStats()

      'elasticsearch:indices-analyze':           -> new IndicesAnalyze()
      'elasticsearch:indices-clear-cache':       -> new IndicesClearCache()
      'elasticsearch:indices-create':            -> new IndicesCreate()
      'elasticsearch:indices-delete':            -> new IndicesDelete()
      'elasticsearch:indices-delete-alias':      -> new IndicesDeleteAlias()
      'elasticsearch:indices-delete-mapping':    -> new IndicesDeleteMapping()
      'elasticsearch:indices-get-mapping':       -> new IndicesGetMapping()
      'elasticsearch:indices-get-settings':      -> new IndicesGetSettings()
      'elasticsearch:indices-put-mapping':       -> new IndicesPutMapping()
      'elasticsearch:indices-put-settings':      -> new IndicesPutSettings()
      'elasticsearch:indices-recovery':          -> new IndicesRecovery()
      'elasticsearch:indices-stats':             -> new IndicesStats()

      'elasticsearch:bulk':                      -> new Bulk()
      'elasticsearch:clear-scroll':              -> new ClearScroll()
      'elasticsearch:count':                     -> new Count()
      'elasticsearch:delete-document':           -> new DeleteDocument()
      'elasticsearch:get-document':              -> new GetDocument()
      'elasticsearch:index-document':            -> new IndexDocument()
      'elasticsearch:info':                      -> new Info()
      'elasticsearch:request-body-search':       -> new RequestBodySearch()
      'elasticsearch:request-body-search-count': -> new RequestBodySearch(searchType: 'count')
      'elasticsearch:search-template':           -> new SearchTemplate()
      'elasticsearch:search-template-count':     -> new SearchTemplate(searchType: 'count')
      'elasticsearch:validate-query':            -> new ValidateQuery()

      'elasticsearch:settings-show-active-server':        -> new ShowActiveServer()
      'elasticsearch:settings-switch-server':             -> new SwitchServer()
