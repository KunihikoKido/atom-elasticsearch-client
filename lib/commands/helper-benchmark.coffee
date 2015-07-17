Os = require 'os'
Path = require 'path'
fs = require 'fs-plus'

remote = require "remote"
BrowserWindow = remote.require "browser-window"
apiBenchmark = require 'api-benchmark'

{BaseCommand} = require './base'
LoadingView = require '../views/loading-view'
config = require '../config'

resultHtmlPath = Path.join Os.tmpDir(), "Benchmark.html"


module.exports =
  class HelperBenchmark extends BaseCommand
    endpoint: "_search"

    makeService: ->
      service =
        elasticsearch: @baseUrl
      return service

    makeRoutes: ({data, query, endpoint}={})->
      endpoint ?= @endpoint

      routes =
        search:
          method: "post"
          route: "/#{@index}/#{@docType}/#{endpoint}"
          data: data
          query: query
          headers: config.getHeaders()
      return routes

    makeData: ->
      text = @getText()
      try
        data = JSON.parse(text)
      catch error
        data = text
      return data

    makeQuery: ({searchType, endpoint}={})->
      query =
        search_type: searchType
      return query

    makeOptions: ->
      options =
        runMode: config.getBenchmarkRunMode()
        maxConcurrentRequests: config.getBenchmarkMaxConcurrentRequests()
        delay: config.getBenchmarkDelay()
        minSamples: config.getBenchmarkMinSamples()
      return options

    run: ({searchType, endpoint}={}) ->
      service = @makeService()
      data = @makeData()
      query = @makeQuery(searchType: searchType)
      routes = @makeRoutes(data: data, query: query, endpoint: endpoint)
      options = @makeOptions()

      lodingView = new LoadingView()
      lodingView.updateMessage("Benchmarking ...")

      apiBenchmark.measure(service, routes, options, (error, results) ->
        apiBenchmark.getHtml(results, (error, html) ->
          lodingView.finish()
          fs.writeFileSync(resultHtmlPath, html)
          win = new BrowserWindow(width: 1200, height: 850, show: false)
          win.on('closed', -> win = null)
          win.loadUrl("file://#{resultHtmlPath}")
          win.show()
        )
      )
