path = require 'path'
statusBarManager = require './status-bar-manager'
{Disposable, CompositeDisposable} = require 'event-kit'

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
IndicesCreateDocType  = require './commands/indices-create-doc-type'
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
DeleteByQuery         = require './commands/delete-by-query'
DeleteDocument        = require './commands/delete-document'
DeleteScript          = require './commands/delete-script'
DeleteSearchTemplate  = require './commands/delete-search-template'
ExistsDocument        = require './commands/exists-document'
ExplainDocument       = require './commands/explain-document'
FieldStats            = require './commands/field-stats'
GetDocument           = require './commands/get-document'
GetDocumentSource     = require './commands/get-document-source'
GetMultipleDocuments  = require './commands/get-multiple-documents'
GetPercolatorQuery    = require './commands/get-percolator-query'
GetScript             = require './commands/get-script'
GetSearchTemplate     = require './commands/get-search-template'
IndexDocument         = require './commands/index-document'
IndexPercolatorQuery  = require './commands/index-percolator-query'
Info                  = require './commands/info'
MultiplePercolate     = require './commands/multiple-percolate'
MultipleSearch        = require './commands/multiple-search'
MultipleTermvectors   = require './commands/multiple-termvectors'
Percolate             = require './commands/percolate'
Ping                  = require './commands/ping'
PutScript             = require './commands/put-script'
PutSearchTemplate     = require './commands/put-search-template'
Scroll                = require './commands/scroll'
SearchExists          = require './commands/search-exists'
SearchRequestBody     = require './commands/search-request-body'
SearchShards          = require './commands/search-shards'
SearchTemplate        = require './commands/search-template'
SearchUri             = require './commands/search-uri'
SearchPercolatorQuery = require './commands/search-percolator-query'
Suggest               = require './commands/suggest'
Termvector            = require './commands/termvector'
UpdateDocument        = require './commands/update-document'

ShowActiveServer      = require './commands/show-active-server'
SwitchServer          = require './commands/switch-server'
SelectIndex           = require './commands/select-index'
SelectDocType         = require './commands/select-doc-type'

HelperCloseOpenIndex       = require './commands/helper-close-open-index'
HelperReindex              = require './commands/helper-reindex'
HelperConvertCsvBulkIndex  = require './commands/helper-convert-csv-bulk-index'
HelperDumpIndexData        = require './commands/helper-dump-index-data'
HelperLoadIndexData        = require './commands/helper-load-index-data'
HelperChangeNumberOfReplicas = require './commands/helper-change-number-of-replicas'
HelperImportCsv              = require './commands/helper-import-csv'
HelperBenchmark            = require './commands/helper-benchmark'


module.exports =
  config:
    baseUrl:
      title: 'Elasticsearch Server'
      type: 'string'
      default: 'http://localhost:9200'
      description: 'The URL of the server for your elasticsearch.'
    index:
      title: 'Elasticsearch Index'
      type: 'string'
      default: 'blog'
      description: 'The name of the index for your elasticsearch.'
    docType:
      title: 'Elasticsearch Type'
      type: 'string'
      default: 'posts'
      description: 'The type of the document for your elasticsearch.'
    apiVersion:
      title: 'Elasticsearch API Version'
      type: 'string'
      default: '1.7'
      description: 'Change the API that they client provides,
      specify the major version of the Elasticsearch nodes
      you will be connecting to.'
    servers:
      type: 'array'
      default: []
    openInPane:
      type: 'boolean'
      default: true
      description: 'Allow commands to open new panes'
    splitPane:
      title: 'Split pane direction (up, right, down, or left)'
      type: 'string'
      default: 'right'
      enum: ['up','right','down', 'left']
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
    scrollSize:
      type: 'string'
      default: '1m'
      description: 'Specify how long a consistent view of the index should
      be maintained for scrolled search'
    traceLog:
      type: 'boolean'
      default: false
      description: 'Enabled trace log for elasticsearch client.'
    traceLogPath:
      type: 'string'
      default: path.join __dirname, '..', 'elasticsearch.log'
      description: 'Location of the file to write log messages to.
      It is created if it does not exists. '
    analytics:
      type: 'boolean'
      default: true
      description: 'There is [Segment.com](https://segment.com/) which forwards data to [Google
      Analytics](http://www.google.com/analytics/) to track what command are being
      used the most, as well as other stats. Everything is anonymized and no personal
      information, such as source code, is sent.'
    benchmarkRunMode:
      type: 'string'
      default: 'sequence'
      enum: ['sequence', 'parallel']
    benchmarkMaxConcurrentRequests:
      type: 'integer'
      default: 100
      description: "When in runMode='parallel' it is the maximum number of concurrent requests are made."
    benchmarkDelay:
      type: 'integer'
      default: 0
      description: "When in runMode='sequence', it is the delay between test cycles (secs)."
    benchmarkMinSamples:
      type: 'integer'
      default: 20
      description: 'The minimum sample size required to perform statistical analysis.'

  activateCommand: (commandName, callback) ->
    atom.commands.add('atom-workspace', commandName, ->
      callback()
      analytics = require './analytics'
      analytics.trackCommand(commandName)
    )

  catchConfigChange: ->
    pkg = require '../package'
    for key of atom.config.get(pkg.name)
      if key not in ["servers", "openInPane", "splitPane", "analytics", "benchmarkRunMode", "benchmarkMaxConcurrentRequests", "benchmarkDelay", "benchmarkMinSamples"]
        keyPath = "#{pkg.name}.#{key}"
        atom.config.onDidChange(keyPath, ({newValue, oldValue}) ->
          config = require './config'
          if config.isValidBaseUrl()
            config.initClient()
        )

  consumeStatusBar: (statusBar) ->
    statusBarManager.initialize(statusBar)
    statusBarManager.attach()
    @disposables.add new Disposable ->
      statusBarManager.detach()
    statusBarManager.update()

  deactivate: ->
    @disposables.dispose()

  activate: ->
    @disposables = new CompositeDisposable

    @catchConfigChange()

    @activateCommand("elasticsearch:cat-aliases", -> new CatAliases())
    @activateCommand("elasticsearch:cat-allocation", -> new CatAllocation())
    @activateCommand("elasticsearch:cat-count", -> new CatCount())
    @activateCommand("elasticsearch:cat-fielddata", -> new CatFielddata())
    @activateCommand("elasticsearch:cat-health", -> new CatHealth())
    @activateCommand("elasticsearch:cat-indices", -> new CatIndices())
    @activateCommand("elasticsearch:cat-master", -> new CatMaster())
    @activateCommand("elasticsearch:cat-nodes", -> new CatNodes())
    @activateCommand("elasticsearch:cat-pending-tasks", -> new CatPendingTasks())
    @activateCommand("elasticsearch:cat-plugins", -> new CatPlugins())
    @activateCommand("elasticsearch:cat-recovery", -> new CatRecovery())
    @activateCommand("elasticsearch:cat-segments", -> new CatSegments())
    @activateCommand("elasticsearch:cat-shards", -> new CatShards())
    @activateCommand("elasticsearch:cat-thread-pool", -> new CatThreadPool())

    @activateCommand("elasticsearch:cluster-get-settings", -> new ClusterGetSettings())
    @activateCommand("elasticsearch:cluster-health", -> new ClusterHealth())
    @activateCommand("elasticsearch:cluster-pending-tasks", -> new ClusterPendingTasks())
    @activateCommand("elasticsearch:cluster-put-settings", -> new ClusterPutSettings())
    @activateCommand("elasticsearch:cluster-reroute", -> new ClusterReroute())
    @activateCommand("elasticsearch:cluster-state", -> new ClusterState())
    @activateCommand("elasticsearch:cluster-stats", -> new ClusterStats())

    @activateCommand("elasticsearch:indices-analyze", -> new IndicesAnalyze())
    @activateCommand("elasticsearch:indices-clear-cache", -> new IndicesClearCache())
    @activateCommand("elasticsearch:indices-close", -> new IndicesClose())
    @activateCommand("elasticsearch:indices-create", -> new IndicesCreate())
    @activateCommand("elasticsearch:indices-create-doc-type", -> new IndicesCreateDocType())
    @activateCommand("elasticsearch:indices-delete", -> new IndicesDelete())
    @activateCommand("elasticsearch:indices-delete-alias", -> new IndicesDeleteAlias())
    @activateCommand("elasticsearch:indices-delete-mapping", -> new IndicesDeleteMapping())
    @activateCommand("elasticsearch:indices-delete-template", -> new IndicesDeleteTemplate())
    @activateCommand("elasticsearch:indices-delete-warmer", -> new IndicesDeleteWarmer())
    @activateCommand("elasticsearch:indices-exists", -> new IndicesExists())
    @activateCommand("elasticsearch:indices-exists-alias", -> new IndicesExistsAlias())
    @activateCommand("elasticsearch:indices-exists-template", -> new IndicesExistsTemplate())
    @activateCommand("elasticsearch:indices-exists-document-type", -> new IndicesExistsDocType())
    @activateCommand("elasticsearch:indices-flush", -> new IndicesFlush())
    @activateCommand("elasticsearch:indices-flush-synced", -> new IndicesFlushSynced())
    @activateCommand("elasticsearch:indices-get", -> new IndicesGet())
    @activateCommand("elasticsearch:indices-get-alias", -> new IndicesGetAlias())
    @activateCommand("elasticsearch:indices-get-field-mapping", -> new IndicesGetFieldMapping())
    @activateCommand("elasticsearch:indices-get-mapping", -> new IndicesGetMapping())
    @activateCommand("elasticsearch:indices-get-settings", -> new IndicesGetSettings())
    @activateCommand("elasticsearch:indices-get-template", -> new IndicesGetTemplate())
    @activateCommand("elasticsearch:indices-get-upgrade", -> new IndicesGetUpgrade())
    @activateCommand("elasticsearch:indices-get-warmer", -> new IndicesGetWarmer())
    @activateCommand("elasticsearch:indices-open", -> new IndicesOpen())
    @activateCommand("elasticsearch:indices-optimize", -> new IndicesOptimize())
    @activateCommand("elasticsearch:indices-put-alias", -> new IndicesPutAlias())
    @activateCommand("elasticsearch:indices-put-mapping", -> new IndicesPutMapping())
    @activateCommand("elasticsearch:indices-put-settings", -> new IndicesPutSettings())
    @activateCommand("elasticsearch:indices-put-template", -> new IndicesPutTemplate())
    @activateCommand("elasticsearch:indices-put-warmer", -> new IndicesPutWarmer())
    @activateCommand("elasticsearch:indices-recovery", -> new IndicesRecovery())
    @activateCommand("elasticsearch:indices-refresh", -> new IndicesRefresh())
    @activateCommand("elasticsearch:indices-segments", -> new IndicesSegments())
    @activateCommand("elasticsearch:indices-stats", -> new IndicesStats())
    @activateCommand("elasticsearch:indices-status", -> new IndicesStatus())
    @activateCommand("elasticsearch:indices-update-aliases", -> new IndicesUpdateAliases())
    @activateCommand("elasticsearch:indices-upgrade", -> new IndicesUpgrade())
    @activateCommand("elasticsearch:indices-validate-query", -> new IndicesValidateQuery())

    @activateCommand("elasticsearch:nodes-hot-threads", -> new NodesHotThreads())
    @activateCommand("elasticsearch:nodes-info", -> new NodesInfo())
    @activateCommand("elasticsearch:nodes-shutdown-all", -> new NodesShutdown(nodeId: "_all"))
    @activateCommand("elasticsearch:nodes-shutdown-local", -> new NodesShutdown(nodeId: "_local"))
    @activateCommand("elasticsearch:nodes-shutdown-master", -> new NodesShutdown(nodeId: "_master"))

    @activateCommand("elasticsearch:snapshot-create", -> new SnapshotCreate())
    @activateCommand("elasticsearch:snapshot-create-repository", -> new SnapshotCreateRepository())
    @activateCommand("elasticsearch:snapshot-delete", -> new SnapshotDelete())
    @activateCommand("elasticsearch:snapshot-delete-repository", -> new SnapshotDeleteRepository())
    @activateCommand("elasticsearch:snapshot-get", -> new SnapshotGet())
    @activateCommand("elasticsearch:snapshot-get-repository", -> new SnapshotGetRepository())
    @activateCommand("elasticsearch:snapshot-restore", -> new SnapshotRestore())
    @activateCommand("elasticsearch:snapshot-status", -> new SnapshotStatus())
    @activateCommand("elasticsearch:snapshot-verify-repository", -> new SnapshotVerifyRepository())

    @activateCommand("elasticsearch:bulk", -> new Bulk())
    @activateCommand("elasticsearch:clear-scroll", -> new ClearScroll())
    @activateCommand("elasticsearch:count", -> new Count())
    @activateCommand("elasticsearch:count-percolate", -> new CountPercolate())
    @activateCommand("elasticsearch:create-document", -> new CreateDocument())
    @activateCommand("elasticsearch:delete-by-query", -> new DeleteByQuery())
    @activateCommand("elasticsearch:delete-document", -> new DeleteDocument())
    @activateCommand("elasticsearch:delete-script", -> new DeleteScript())
    @activateCommand("elasticsearch:delete-search-template", -> new DeleteSearchTemplate())
    @activateCommand("elasticsearch:exists-document", -> new ExistsDocument())
    @activateCommand("elasticsearch:explain-document", -> new ExplainDocument())
    @activateCommand("elasticsearch:field-stats", -> new FieldStats())
    @activateCommand("elasticsearch:get-document", -> new GetDocument())
    @activateCommand("elasticsearch:get-document-source", -> new GetDocumentSource())
    @activateCommand("elasticsearch:get-script", -> new GetScript())
    @activateCommand("elasticsearch:get-search-template", -> new GetSearchTemplate())
    @activateCommand("elasticsearch:get-multiple-documents", -> new GetMultipleDocuments())
    @activateCommand("elasticsearch:get-percolator-query", -> new GetPercolatorQuery())
    @activateCommand("elasticsearch:multiple-percolate", -> new MultiplePercolate())
    @activateCommand("elasticsearch:multiple-search", -> new MultipleSearch())
    @activateCommand("elasticsearch:multiple-termvectors", -> new MultipleTermvectors())
    @activateCommand("elasticsearch:index-document", -> new IndexDocument())
    @activateCommand("elasticsearch:index-percolator-query", -> new IndexPercolatorQuery())
    @activateCommand("elasticsearch:info", -> new Info())
    @activateCommand("elasticsearch:percolate", -> new Percolate())
    @activateCommand("elasticsearch:ping", -> new Ping())
    @activateCommand("elasticsearch:put-script", -> new PutScript())
    @activateCommand("elasticsearch:put-search-template", -> new PutSearchTemplate())
    @activateCommand("elasticsearch:scroll", -> new Scroll())
    @activateCommand("elasticsearch:search-exists", -> new SearchExists())
    @activateCommand("elasticsearch:search-request-body", -> new SearchRequestBody())
    @activateCommand("elasticsearch:search-request-body-count", -> new SearchRequestBody(searchType: 'count'))
    @activateCommand("elasticsearch:search-request-body-scan", -> new SearchRequestBody(searchType: 'scan'))
    @activateCommand("elasticsearch:search-shards", -> new SearchShards())
    @activateCommand("elasticsearch:search-template", -> new SearchTemplate())
    @activateCommand("elasticsearch:search-template-count", -> new SearchTemplate(searchType: 'count'))
    @activateCommand("elasticsearch:search-template-scan", -> new SearchTemplate(searchType: 'scan'))
    @activateCommand("elasticsearch:search-simple-query", -> new SearchUri())
    @activateCommand("elasticsearch:search-percolator-query", -> new SearchPercolatorQuery())
    @activateCommand("elasticsearch:suggest", -> new Suggest())
    @activateCommand("elasticsearch:termvector", -> new Termvector())
    @activateCommand("elasticsearch:update-document", -> new UpdateDocument())


    @activateCommand("elasticsearch:settings-show-active-server", -> new ShowActiveServer())
    @activateCommand("elasticsearch:settings-switch-server", -> new SwitchServer())
    @activateCommand("elasticsearch:settings-select-index", -> new SelectIndex())
    @activateCommand("elasticsearch:settings-select-doc-type", -> new SelectDocType())

    @activateCommand("elasticsearch:helper-close-open-index", -> new HelperCloseOpenIndex())
    @activateCommand("elasticsearch:helper-reindex", -> new HelperReindex())
    @activateCommand("elasticsearch:helper-convert-csv-bulk-index", -> new HelperConvertCsvBulkIndex())
    @activateCommand("elasticsearch:helper-dump-index-data", -> new HelperDumpIndexData())
    @activateCommand("elasticsearch:helper-load-index-data", -> new HelperLoadIndexData())
    @activateCommand("elasticsearch:helper-change-number-of-replicas", -> new HelperChangeNumberOfReplicas())
    @activateCommand("elasticsearch:helper-import-csv", -> new HelperImportCsv())
    @activateCommand("elasticsearch:helper-benchmark-for-search-request-body", -> new HelperBenchmark())
    @activateCommand("elasticsearch:helper-benchmark-for-search-request-body-count", -> new HelperBenchmark(searchType: 'count'))
    @activateCommand("elasticsearch:helper-benchmark-for-search-template", -> new HelperBenchmark(endpoint: '_search/template'))
    @activateCommand("elasticsearch:helper-benchmark-for-search-template-count", -> new HelperBenchmark(endpoint: '_search/template', searchType: 'count'))
