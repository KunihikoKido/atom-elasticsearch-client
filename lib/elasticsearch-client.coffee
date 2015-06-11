ElasticsearchClientView = require './elasticsearch-client-view'

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
    elasticsearchClientView = new ElasticsearchClientView()
