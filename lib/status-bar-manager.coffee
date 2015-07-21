config = require './config'


class StatusBarManager
  constructor: ->
    @element = document.createElement("div")
    @element.id = "status-bar-elasticsearch"
    @element.className = "icon icon-server"

    @container = document.createElement("div")
    @container.className = "inline-block"
    @container.appendChild(@element)

  initialize: (@statusBar) ->

  update: ->
    baseUrl = config.getBaseUrl()
    @element.textContent = "#{baseUrl}"

  # Private

  attach: ->
    @tile = @statusBar.addRightTile(item: @container, priority: 20)

  detach: ->
    @tile.destroy()


module.exports =
  statusBarManager: null
  initialize: (statusBar) ->
    @statusBarManager = new StatusBarManager()
    @statusBarManager?.initialize(statusBar)
  attach: ->
    @statusBarManager?.attach()
  detach: ->
    @statusBarManager?.detach()
  update: ->
    @statusBarManager?.update()
