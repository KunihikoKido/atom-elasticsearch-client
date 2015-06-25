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
IndicesClose          = require './commands/indices-close'
IndicesCreate         = require './commands/indices-create'
IndicesDelete         = require './commands/indices-delete'
IndicesDeleteAlias    = require './commands/indices-delete-alias'
IndicesDeleteMapping  = require './commands/indices-delete-mapping'
IndicesDeleteTemplate = require './commands/indices-delete-template'
IndicesDeleteWarmer   = require './commands/indices-delete-warmer'
IndicesExists         = require './commands/indices-exists'
IndicesExistsAlias    = require './commands/indices-exists-alias'
IndicesExistsTemplate = require './commands/indices-exists-template'
IndicesExistsDocType  = require './commands/indices-exists-doc-type'
IndicesFlush          = require './commands/indices-flush'
IndicesFlushSynced    = require './commands/indices-flush-synced'
IndicesGet            = require './commands/indices-get'
IndicesGetAlias       = require './commands/indices-get-alias'
IndicesGetFieldMapping = require './commands/indices-get-field-mapping'
IndicesGetMapping     = require './commands/indices-get-mapping'
IndicesGetSettings    = require './commands/indices-get-settings'
IndicesGetTemplate    = require './commands/indices-get-template'
IndicesGetUpgrade     = require './commands/indices-get-upgrade'
IndicesGetWarmer      = require './commands/indices-get-warmer'
IndicesOpen           = require './commands/indices-open'
IndicesOptimize       = require './commands/indices-optimize'
IndicesPutAlias       = require './commands/indices-put-alias'
IndicesPutMapping     = require './commands/indices-put-mapping'
IndicesPutSettings    = require './commands/indices-put-settings'
IndicesPutTemplate    = require './commands/indices-put-template'
IndicesPutWarmer      = require './commands/indices-put-warmer'
IndicesRecovery       = require './commands/indices-recovery'
IndicesRefresh        = require './commands/indices-refresh'
IndicesSegments       = require './commands/indices-segments'
IndicesStats          = require './commands/indices-stats'
IndicesStatus         = require './commands/indices-status'
IndicesUpdateAliases  = require './commands/indices-update-aliases'
IndicesUpgrade        = require './commands/indices-upgrade'
IndicesValidateQuery  = require './commands/indices-validate-query'

NodesHotThreads       = require './commands/nodes-hot-threads'
NodesInfo             = require './commands/nodes-info'
NodesShutdown         = require './commands/nodes-shutdown'

SnapshotCreate           = require './commands/snapshot-create'
SnapshotCreateRepository = require './commands/snapshot-create-repository'
SnapshotDelete           = require './commands/snapshot-delete'
SnapshotDeleteRepository = require './commands/snapshot-delete-repository'
SnapshotGet              = require './commands/snapshot-get'
SnapshotGetRepository    = require './commands/snapshot-get-repository'
SnapshotRestore          = require './commands/snapshot-restore'
SnapshotStatus           = require './commands/snapshot-status'
SnapshotVerifyRepository = require './commands/snapshot-verify-repository'

Bulk                  = require './commands/bulk'
ClearScroll           = require './commands/clear-scroll'
Count                 = require './commands/count'
CountPercolate        = require './commands/count-percolate'
CreateDocument        = require './commands/create-document'
DeleteDocument        = require './commands/delete-document'
DeleteByQueryWithQueryDsl     = require './commands/delete-by-query-with-query-dsl'
DeleteByQueryWithSimpleQuery  = require './commands/delete-by-query-with-simple-query'
DeleteScript          = require './commands/delete-script'
DeleteSearchTemplate  = require './commands/delete-search-template'
ExistsDocument        = require './commands/exists-document'
ExplainDocument       = require './commands/explain-document'
FieldStats            = require './commands/field-stats'
GetDocument           = require './commands/get-document'
GetScript             = require './commands/get-script'
GetDocumentSource     = require './commands/get-document-source'
GetSearchTemplate     = require './commands/get-search-template'
GetMultipleDocuments  = require './commands/get-multiple-documents'
MultiplePercolate     = require './commands/multiple-percolate'
MultipleSearch        = require './commands/multiple-search'
MultipleTermvectors   = require './commands/multiple-termvectors'
IndexDocument         = require './commands/index-document'
Info                  = require './commands/info'
Percolate             = require './commands/percolate'
Ping                  = require './commands/ping'
PutScript             = require './commands/put-script'
PutSearchTemplate     = require './commands/put-search-template'
Scroll                = require './commands/scroll'
SearchRequestBody     = require './commands/search-request-body'
SearchTemplate        = require './commands/search-template'
SearchUri             = require './commands/search-uri'


ShowActiveServer      = require './commands/show-active-server'
SwitchServer          = require './commands/switch-server'

helperReindex         = require './commands/helper-reindex'

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
    scroll:
      type: 'string'
      default: '5m'
      description: 'Specify how long a consistent view of the index should
      be maintained for scrolled search'

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
      'elasticsearch:indices-close':             -> new IndicesClose()
      'elasticsearch:indices-create':            -> new IndicesCreate()
      'elasticsearch:indices-delete':            -> new IndicesDelete()
      'elasticsearch:indices-delete-alias':      -> new IndicesDeleteAlias()
      'elasticsearch:indices-delete-mapping':    -> new IndicesDeleteMapping()
      'elasticsearch:indices-delete-template':   -> new IndicesDeleteTemplate()
      'elasticsearch:indices-delete-warmer':     -> new IndicesDeleteWarmer()
      'elasticsearch:indices-exists':            -> new IndicesExists()
      'elasticsearch:indices-exists-alias':      -> new IndicesExistsAlias()
      'elasticsearch:indices-exists-template':   -> new IndicesExistsTemplate()
      'elasticsearch:indices-exists-document-type':  -> new IndicesExistsDocType()
      'elasticsearch:indices-flush':             -> new IndicesFlush()
      'elasticsearch:indices-flush-synced':      -> new IndicesFlushSynced()
      'elasticsearch:indices-get':               -> new IndicesGet()
      'elasticsearch:indices-get-alias':         -> new IndicesGetAlias()
      'elasticsearch:indices-get-field-mapping': -> new IndicesGetFieldMapping()
      'elasticsearch:indices-get-mapping':       -> new IndicesGetMapping()
      'elasticsearch:indices-get-settings':      -> new IndicesGetSettings()
      'elasticsearch:indices-get-template':      -> new IndicesGetTemplate()
      'elasticsearch:indices-get-upgrade':       -> new IndicesGetUpgrade()
      'elasticsearch:indices-get-warmer':        -> new IndicesGetWarmer()
      'elasticsearch:indices-open':              -> new IndicesOpen()
      'elasticsearch:indices-optimize':          -> new IndicesOptimize()
      'elasticsearch:indices-put-alias':         -> new IndicesPutAlias()
      'elasticsearch:indices-put-mapping':       -> new IndicesPutMapping()
      'elasticsearch:indices-put-settings':      -> new IndicesPutSettings()
      'elasticsearch:indices-put-template':      -> new IndicesPutTemplate()
      'elasticsearch:indices-put-warmer':        -> new IndicesPutWarmer()
      'elasticsearch:indices-recovery':          -> new IndicesRecovery()
      'elasticsearch:indices-refresh':           -> new IndicesRefresh()
      'elasticsearch:indices-segments':          -> new IndicesSegments()
      'elasticsearch:indices-stats':             -> new IndicesStats()
      'elasticsearch:indices-status':            -> new IndicesStatus()
      'elasticsearch:indices-update-aliases':    -> new IndicesUpdateAliases()
      'elasticsearch:indices-upgrade':           -> new IndicesUpgrade()
      'elasticsearch:indices-validate-query':    -> new IndicesValidateQuery()

      'elasticsearch:nodes-hot-threads':         -> new NodesHotThreads()
      'elasticsearch:nodes-info':                -> new NodesInfo()
      'elasticsearch:nodes-shutdown-all':        -> new NodesShutdown(nodeId: "_all")
      'elasticsearch:nodes-shutdown-local':      -> new NodesShutdown(nodeId: "_local")
      'elasticsearch:nodes-shutdown-master':     -> new NodesShutdown(nodeId: "_master")

      'elasticsearch:snapshot-create':            -> new SnapshotCreate()
      'elasticsearch:snapshot-create-repository': -> new SnapshotCreateRepository()
      'elasticsearch:snapshot-delete':            -> new SnapshotDelete()
      'elasticsearch:snapshot-delete-repository': -> new SnapshotDeleteRepository()
      'elasticsearch:snapshot-get':               -> new SnapshotGet()
      'elasticsearch:snapshot-get-repository':    -> new SnapshotGetRepository()
      'elasticsearch:snapshot-restore':           -> new SnapshotRestore()
      'elasticsearch:snapshot-status':            -> new SnapshotStatus()
      'elasticsearch:snapshot-verify-repository': -> new SnapshotVerifyRepository()

      'elasticsearch:bulk':                      -> new Bulk()
      'elasticsearch:clear-scroll':              -> new ClearScroll()
      'elasticsearch:count':                     -> new Count()
      'elasticsearch:count-percolate':           -> new CountPercolate()
      'elasticsearch:create-document':           -> new CreateDocument()
      'elasticsearch:delete-by-query-with-query-dsl':     -> new DeleteByQueryWithQueryDsl()
      'elasticsearch:delete-by-query-with-simple-query':  -> new DeleteByQueryWithSimpleQuery()
      'elasticsearch:delete-document':           -> new DeleteDocument()
      'elasticsearch:delete-script':             -> new DeleteScript()
      'elasticsearch:delete-search-template':    -> new DeleteSearchTemplate()
      'elasticsearch:exists-document':           -> new ExistsDocument()
      'elasticsearch:explain-document':          -> new ExplainDocument()
      'elasticsearch:field-stats':               -> new FieldStats()
      'elasticsearch:get-document':              -> new GetDocument()
      'elasticsearch:get-document-source':       -> new GetDocumentSource()
      'elasticsearch:get-script':                -> new GetScript()
      'elasticsearch:get-search-template':       -> new GetSearchTemplate()
      'elasticsearch:get-multiple-documents':    -> new GetMultipleDocuments()
      'elasticsearch:multiple-percolate':        -> new MultiplePercolate()
      'elasticsearch:multiple-search':           -> new MultipleSearch()
      'elasticsearch:multiple-termvectors':      -> new MultipleTermvectors()
      'elasticsearch:index-document':            -> new IndexDocument()
      'elasticsearch:info':                      -> new Info()
      'elasticsearch:percolate':                 -> new Percolate()
      'elasticsearch:ping':                      -> new Ping()
      'elasticsearch:put-script':                -> new PutScript()
      'elasticsearch:put-search-template':       -> new PutSearchTemplate()
      'elasticsearch:scroll':                    -> new Scroll()
      'elasticsearch:search-request-body':       -> new SearchRequestBody()
      'elasticsearch:search-request-body-count': -> new SearchRequestBody(searchType: 'count')
      'elasticsearch:search-template':           -> new SearchTemplate()
      'elasticsearch:search-template-count':     -> new SearchTemplate(searchType: 'count')
      'elasticsearch:search-uri':                -> new SearchUri()

      'elasticsearch:settings-show-active-server':        -> new ShowActiveServer()
      'elasticsearch:settings-switch-server':             -> new SwitchServer()

      'elasticsearch:helper-reindex':            -> helperReindex()
