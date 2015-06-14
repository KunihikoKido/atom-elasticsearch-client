ElasticsearchClientCommand = require './elasticsearch-client-command'

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
    servers:
      type: 'array'
      default: []

  activate: ->
    elasticsearchClientCommand = new ElasticsearchClientCommand()
