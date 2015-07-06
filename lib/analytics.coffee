uuid = require 'node-uuid'
pkg = require '../package.json'
Analytics = require 'analytics-node'


module.exports =
  namespace: pkg.name
  version: pkg.version
  analyticsWriteKey: "phc2hsUe48Dfw1iwsYQs2W7HH9jcwrws"
  analytics: null

  enabled: () ->
    return atom.config.get("#{@namespace}.analytics")

  getUserId: ->
    return atom.config.get("#{@namespace}.analyticsUserId")

  setUserId: (userId) ->
    atom.config.set("#{@namespace}.analyticsUserId", userId)

  getAnalytics: ->
    if not @getUserId()
      @setUserId(uuid.v4())
    @analytics ?= new Analytics(@analyticsWriteKey)
    return @analytics

  trackCommand: (commandName) ->
    if not @enabled()
      return

    analytics = @getAnalytics()

    analytics.track({
      userId: @getUserId(),
      event: 'Run Command',
      properties: {
        devMode: atom.inDevMode(),
        version: @version,
        label: commandName,
        category: @version
      }
    })

  trackActivate: ->
    if not @enabled()
      return

    analytics = @getAnalytics()

    analytics.track({
      userId: @getUserId(),
      event: 'Activate',
      properties: {
        devMode: atom.inDevMode(),
        version: @version,
        label: "activate"
        category: @version
      }
    })
