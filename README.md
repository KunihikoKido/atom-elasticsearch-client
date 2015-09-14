# Elasticsearch Client for Atom

Elasticsearch Client allows you to build an Rest API request in Atom editor and view the response.

![overview](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/screenshots/search.gif)

## Installation
Atom Package: https://atom.io/packages/elasticsearch-client

```bash
apm install elasticsearch-client
```

Or Preferences ➔ Settings/Install ➔ Search for elasticsearch-client

## Using
You can send a body.

```json
{
  "query": {
    "match_all": {}
  }
}
```

Once you have a request ready, use shortcut ``Ctrl + Alt + S`` or open the Command Palette (Shift + Command + P) and enter ``Elasticsearch Search Request Body``.

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

You can switch the server, use ``Elasticsearch: Settings Switch Server`` command.

### Supported Elasticsearch Versions
![Supporting Elasticsearch Version 0.90 to 1.7](http://img.shields.io/badge/elasticsearch-0.90--2.0-green.svg?style=flat-square)

Set the apiVersion option. To tell the client which version of Elastisearch you are using. Default to 1.7

## Snippets
Currently this should work in ``.json`` file or Supported Grammars.

* **Query DSL Snippets**
  - Work in Grammars: JSON / Elasticsearch (Query DSL)
* **Index Aliases Snippets**
  - Work in Grammars: JSON / Elasticsearch (Index Aliases)
* **Mapping Snippets**
  - Work in Grammars: JSON / Elasticsearch (Mapping)
* **Snapshot Snippets**
  - Work in Grammars: JSON / Elasticsearch (Snapshot)

## Commands

### Command for Search & Document APIs

* Elasticsearch: Bulk
* Elasticsearch: Clear Scroll
* Elasticsearch: Count
* Elasticsearch: Count Percolate
* Elasticsearch: Create Document
* Elasticsearch: Delete By Query
* Elasticsearch: Delete Document
* Elasticsearch: Delete Script
* Elasticsearch: Delete Search Template
* Elasticsearch: Exists Document
* Elasticsearch: Explain Document
* Elasticsearch: Field Stats
* Elasticsearch: Get Document
* Elasticsearch: Get Document Source
* Elasticsearch: Get Multiple Documents
* Elasticsearch: Get Percolator Query
* Elasticsearch: Get Script
* Elasticsearch: Get Search Template
* Elasticsearch: Index Document
* Elasticsearch: Index Percolator Query
* Elasticsearch: Info
* Elasticsearch: Multiple Percolate
* Elasticsearch: Multiple Search
* Elasticsearch: Multiple Termvectors
* Elasticsearch: Percolate
* Elasticsearch: Ping
* Elasticsearch: Put Script
* Elasticsearch: Put Search Template
* Elasticsearch: Scroll
* Elasticsearch: Search Exists
* Elasticsearch: Search Percolator Query
* Elasticsearch: Search Request Body
* Elasticsearch: Search Request Body Count
* Elasticsearch: Search Request Body Scan
* Elasticsearch: Search Shards
* Elasticsearch: Search Simple Query
* Elasticsearch: Search Template
* Elasticsearch: Search Template Count
* Elasticsearch: Search Template Scan
* Elasticsearch: Suggest
* Elasticsearch: Termvector
* Elasticsearch: Update Document


### Command for Cat APIs

* Elasticsearch: Cat Aliases
* Elasticsearch: Cat Allocation
* Elasticsearch: Cat Count
* Elasticsearch: Cat Fielddata
* Elasticsearch: Cat Health
* Elasticsearch: Cat Indices
* Elasticsearch: Cat Master
* Elasticsearch: Cat Nodes
* Elasticsearch: Cat Pending Tasks
* Elasticsearch: Cat Plugins
* Elasticsearch: Cat Recovery
* Elasticsearch: Cat Segments
* Elasticsearch: Cat Shards
* Elasticsearch: Cat Thread Pool

### Command for Cluster APIs

* Elasticsearch: Cluster Get Settings
* Elasticsearch: Cluster Health
* Elasticsearch: Cluster Pending Tasks
* Elasticsearch: Cluster Put Settings
* Elasticsearch: Cluster Reroute
* Elasticsearch: Cluster State
* Elasticsearch: Cluster Stats

### Command for Indices APIs

* Elasticsearch: Indices Analyze
* Elasticsearch: Indices Clear Cache
* Elasticsearch: Indices Close
* Elasticsearch: Indices Create
* Elasticsearch: Indices Delete
* Elasticsearch: Indices Delete Alias
* Elasticsearch: Indices Delete Mapping
* Elasticsearch: Indices Delete Template
* Elasticsearch: Indices Delete Warmer
* Elasticsearch: Indices Exists
* Elasticsearch: Indices Exists Alias
* Elasticsearch: Indices Exists Document Type
* Elasticsearch: Indices Exists Template
* Elasticsearch: Indices Flush
* Elasticsearch: Indices Flush Synced
* Elasticsearch: Indices Get
* Elasticsearch: Indices Get Alias
* Elasticsearch: Indices Get Field Mapping
* Elasticsearch: Indices Get Mapping
* Elasticsearch: Indices Get Settings
* Elasticsearch: Indices Get Template
* Elasticsearch: Indices Get Upgrade
* Elasticsearch: Indices Get Warmer
* Elasticsearch: Indices Open
* Elasticsearch: Indices Optimize
* Elasticsearch: Indices Put Alias
* Elasticsearch: Indices Put Mapping
* Elasticsearch: Indices Put Settings
* Elasticsearch: Indices Put Template
* Elasticsearch: Indices Put Warmer
* Elasticsearch: Indices Recovery
* Elasticsearch: Indices Refresh
* Elasticsearch: Indices Segments
* Elasticsearch: Indices Stats
* Elasticsearch: Indices Status
* Elasticsearch: Indices Update Aliases
* Elasticsearch: Indices Upgrade
* Elasticsearch: Indices Validate Query

### Command for Nodes APIs

* Elasticsearch: Nodes Hot Threads
* Elasticsearch: Nodes Info
* Elasticsearch: Nodes Shutdown All
* Elasticsearch: Nodes Shutdown Local
* Elasticsearch: Nodes Shutdown Master

### Command for Snapshot APIs

* Elasticsearch: Snapshot Create
* Elasticsearch: Snapshot Create Repository
* Elasticsearch: Snapshot Delete
* Elasticsearch: Snapshot Delete Repository
* Elasticsearch: Snapshot Get
* Elasticsearch: Snapshot Get Repository
* Elasticsearch: Snapshot Restore
* Elasticsearch: Snapshot Status
* Elasticsearch: Snapshot Verify Repository

### Helper Commands

* Elasticsearch: Helper Benchmark For Search Request Body
* Elasticsearch: Helper Benchmark For Search Request Body Count
* Elasticsearch: Helper Benchmark For Search Template
* Elasticsearch: Helper Benchmark For Search Template Count
* Elasticsearch: Helper Change Number Of Replicas
* Elasticsearch: Helper Close Open Index
* Elasticsearch: Helper Convert Csv Bulk Index
* Elasticsearch: Helper Dump Index Data
* Elasticsearch: Helper Import Csv
* Elasticsearch: Helper Load Index Data
* Elasticsearch: Helper Reindex


### Command for User Settings

* Elasticsearch: Settings Select Doc Type
* Elasticsearch: Settings Select Index
* Elasticsearch: Settings Show Active Server
* Elasticsearch: Settings Switch Server

## Screenshots

### Search Request Body Command
![search](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/screenshots/search.gif)

### Cat Api Command
![cat](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/screenshots/cat.gif)

## Helper Reindex Command
![reindex](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/screenshots/reindex.gif)

## Helper Benchmark
![reindex](https://raw.githubusercontent.com/KunihikoKido/atom-elasticsearch-client/master/screenshots/benchmark.gif)

## Recommended Atom Packages for Elasticsearch Developers

* [atom-beautify](https://atom.io/packages/atom-beautify) (by Glavin001) - Pretty your Query DSL.
* [drop-base64-encoding](https://atom.io/packages/drop-base64-encoding) (by KunihikoKido) - Convert to base64 encoded string for Elasticsearch Attachment Type
* [extract-web](https://atom.io/packages/extract-web) (by KunihikoKido) - Extract Website utility.
* [flatten-json](https://atom.io/packages/flatten-json) (by KunihikoKido) - Flatten (Unflatten) JSON Converter
* [json-converter](https://atom.io/packages/json-converter) (by KunihikoKido) - CSV to Json, Json to CSV and more.
* [json-path-finder](https://atom.io/packages/json-path-finder) (by KunihikoKido) - JSON Path finder
* [linter-jsonlint](https://atom.io/packages/linter-jsonlint) (by AtomLinter) - The JSON Validator.
* [mustache-compiler](https://atom.io/packages/mustache-compiler) (by kwkoizumi) - Compile your Search Templates.
