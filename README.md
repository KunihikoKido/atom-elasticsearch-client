# Elasticsearch Client for Atom

Elasticsearch Client allows you to build an Rest API request in Atom editor and view the response.

![overview](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/overview.gif)

## Using
You can send a body.

```json
{
  "query": {
    "match_all": {}
  }
}
```

Once you have a request ready, use shortcut ``Ctrl + Alt + S`` or open the Command Palette (Shift + Command + P) and enter ``Elasticsearch Request Body Search``.

## Settings
Settings (Atom/Open Your Config). edit ``config.cson``

*Example*
```yaml
"elasticsearch-client":
  baseUrl: "http://localhost:9200"
  index: "blog"
  docType: "posts"
  servers: [
    {
      baseUrl: "http://localhost:9200"
      index: "blog"
      docType: "posts"
    }
    {
      baseUrl: "http://localhost:9200"
      index: "twitter"
      docType: "tweets"
    }
  ]
```

You can switch the server, use ``Elasticsearch : Switch Server`` command.

## Snippets
Currently this should work in ``.json`` file

## Commands

### Command for Basic APIs

* Elasticsearch:Get Document
* Elasticsearch:Index Document
* Elasticsearch:Info
* Elasticsearch:Request Body Search
* Elasticsearch:Request Body Search Count
* Elasticsearch:Search Template
* Elasticsearch:Search Template Count
* Elasticsearch:Validate Query


### Command for Cat APIs

* Elasticsearch:Cat Aliases
* Elasticsearch:Cat Allocation
* Elasticsearch:Cat Count
* Elasticsearch:Cat Fielddata
* Elasticsearch:Cat Health
* Elasticsearch:Cat Indices
* Elasticsearch:Cat Master
* Elasticsearch:Cat Nodes
* Elasticsearch:Cat Pending Tasks
* Elasticsearch:Cat Plugins
* Elasticsearch:Cat Recovery
* Elasticsearch:Cat Segments
* Elasticsearch:Cat Shards
* Elasticsearch:Cat Thread Pool

### Command for Indices APIs

* Elasticsearch:Indices Analyze
* Elasticsearch:Indices Clear Cache
* Elasticsearch:Indices Create
* Elasticsearch:Indices Delete
* Elasticsearch:Indices Delete Mapping
* Elasticsearch:Indices Get Mapping
* Elasticsearch:Indices Get Settings
* Elasticsearch:Indices Put Mapping
* Elasticsearch:Indices Put Settings

### Command for Cluster APIs

* Elasticsearch:Cluster Get Settings
* Elasticsearch:Cluster Health
* Elasticsearch:Cluster Pending Tasks
* Elasticsearch:Cluster Put Settings
* Elasticsearch:Cluster Reroute
* Elasticsearch:Cluster State
* Elasticsearch:Cluster Stats

### Command for User Settings

* Elasticsearch :Show Active Server
* Elasticsearch :Switch Server
