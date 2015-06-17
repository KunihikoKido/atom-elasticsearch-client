# ElasticsearchClientCommand = require './elasticsearch-client-command'
CatAliases        = require './commands/cat-aliases'
CatAllocation     = require './commands/cat-allocation'
CatCount          = require './commands/cat-count'
CatFielddata      = require './commands/cat-fielddata'
CatHealth         = require './commands/cat-health'
CatIndices        = require './commands/cat-indices'
CatMaster         = require './commands/cat-master'
CatNodes          = require './commands/cat-nodes'
CatPendingTasks   = require './commands/cat-pending-tasks'
CatPlugins        = require './commands/cat-plugins'
CatRecovery       = require './commands/cat-recovery'
CatSegments       = require './commands/cat-segments'
CatShards         = require './commands/cat-shards'
CatThreadPool     = require './commands/cat-thread-pool'

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
IndicesDeleteMapping  = require './commands/indices-delete-mapping'
IndicesDelete         = require './commands/indices-delete'
IndicesGetMapping     = require './commands/indices-get-mapping'
IndicesGetSettings    = require './commands/indices-get-settings'
IndicesPutMapping     = require './commands/indices-put-mapping'
IndicesPutSettings    = require './commands/indices-put-settings'

RequestBodySearch  = require './commands/request-body-search'
ValidateQuery      = require './commands/validate-query'

ShowActiveServer  = require './commands/show-active-server'
SwitchServer      = require './commands/switch-server'


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
      description: 'Enter comma separated custom analyzer names.'


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
      'elasticsearch:indices-delete-mapping':    -> new IndicesDeleteMapping()
      'elasticsearch:indices-delete':            -> new IndicesDelete()
      'elasticsearch:indices-get-mapping':       -> new IndicesGetMapping()
      'elasticsearch:indices-get-settings':      -> new IndicesGetSettings()
      'elasticsearch:indices-put-mapping':       -> new IndicesPutMapping()
      'elasticsearch:indices-put-settings':      -> new IndicesPutSettings()

      'elasticsearch:request-body-search':       -> new RequestBodySearch()
      'elasticsearch:request-body-search-count': -> new RequestBodySearch(searchType: 'count')
      'elasticsearch:validate-query':            -> new ValidateQuery()

      'elasticsearch:show-active-server':        -> new ShowActiveServer()
      'elasticsearch:switch-server':             -> new SwitchServer()
