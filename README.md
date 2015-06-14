# Elasticsearch Client for Atom

Elasticsearch Client allows you to build an Rest API request in Atom editor and view the response.

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


## Command for Cat APIs

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

## Command for Document APIs

* Elasticsearch:Docs Index Document

## Command for Indices APIs

* Elasticsearch:Indices Analyze Cjk
* Elasticsearch:Indices Analyze Default
* Elasticsearch:Indices Analyze English
* Elasticsearch:Indices Analyze Keyword
* Elasticsearch:Indices Analyze Pattern
* Elasticsearch:Indices Analyze Simple
* Elasticsearch:Indices Analyze Snowball
* Elasticsearch:Indices Analyze Standard
* Elasticsearch:Indices Analyze Stop
* Elasticsearch:Indices Analyze Whitespace
* Elasticsearch:Indices Create Index
* Elasticsearch:Indices Delete Index
* Elasticsearch:Indices Delete Mapping
* Elasticsearch:Indices Get Mapping
* Elasticsearch:Indices Get Settings
* Elasticsearch:Indices Put Mapping

## Command for Search APIs

* Elasticsearch:Search Request Body Search
* Elasticsearch:Search Search Template
* Elasticsearch:Search Validate Query

## Command for Node APIs

* Elasticsearch:Server Info

## Command for User Settings

* Elasticsearch :Show Active Server
* Elasticsearch :Switch Server
