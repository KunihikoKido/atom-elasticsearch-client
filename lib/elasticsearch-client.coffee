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

IndicesAnalyze     = require './commands/indices-analyze'
IndicesClearCache  = require './commands/indices-clear-cache'
IndicesCreate      = require './commands/indices-create'
IndicesDelete      = require './commands/indices-delete'
IndicesGetMapping  = require './commands/indices-get-mapping'
IndicesGetSettings = require './commands/indices-get-settings'
IndicesPutMapping  = require './commands/indices-put-mapping'
IndicesPutSettings = require './commands/indices-put-settings'

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
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-aliases',                  -> new CatAliases()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-allocation',               -> new CatAllocation()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-count',                    -> new CatCount()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-fielddata',                -> new CatFielddata()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-health',                   -> new CatHealth()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-indices',                  -> new CatIndices()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-master',                   -> new CatMaster()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-nodes',                    -> new CatNodes()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-pending-tasks',            -> new CatPendingTasks()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-plugins',                  -> new CatPlugins()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-recovery',                 -> new CatRecovery()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-segments',                 -> new CatSegments()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-shards',                   -> new CatShards()
    atom.commands.add 'atom-workspace', 'elasticsearch:cat-thread-pool',              -> new CatThreadPool()

    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-get-settings',         -> new ClusterGetSettings()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-health',               -> new ClusterHealth()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-pending-tasks',        -> new ClusterPendingTasks()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-put-settings',         -> new ClusterPutSettings()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-reroute',              -> new ClusterReroute()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-state',                -> new ClusterState()
    atom.commands.add 'atom-workspace', 'elasticsearch:cluster-stats',                -> new ClusterStats()

    atom.commands.add 'atom-workspace', 'elasticsearch:indices-analyze',              -> new IndicesAnalyze()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-clear-cache',          -> new IndicesClearCache()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-create',               -> new IndicesCreate()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-delete',               -> new IndicesDelete()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-get-mapping',          -> new IndicesGetMapping()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-get-settings',         -> new IndicesGetSettings()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-put-mapping',          -> new IndicesPutMapping()
    atom.commands.add 'atom-workspace', 'elasticsearch:indices-put-settings',         -> new IndicesPutSettings()

    atom.commands.add 'atom-workspace', 'elasticsearch:request-body-search',          -> new RequestBodySearch()
    atom.commands.add 'atom-workspace', 'elasticsearch:request-body-search-count',    -> new RequestBodySearch(searchType: 'count')
    atom.commands.add 'atom-workspace', 'elasticsearch:validate-query',               -> new ValidateQuery()

    atom.commands.add 'atom-workspace', 'elasticsearch:show-active-server',           -> new ShowActiveServer()
    atom.commands.add 'atom-workspace', 'elasticsearch:switch-server',                -> new SwitchServer()

    # elasticsearchClientCommand = new ElasticsearchClientCommand()
