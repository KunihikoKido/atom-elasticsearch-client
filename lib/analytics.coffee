uuid = require 'node-uuid'
pkg = require '../package.json'
Analytics = require 'analytics-node'
config = require './config'

module.exports =
  namespace: pkg.name
  atomVersion: atom.getVersion()
  pkgVersion: pkg.version
  devMode: atom.inDevMode()

  analyticsWriteKey: "phc2hsUe48Dfw1iwsYQs2W7HH9jcwrws"
  analytics: null

  enabled: () ->
    return atom.config.get("#{@namespace}.analytics")

  getUserId: ->
    return localStorage.getItem("#{@namespace}.userId")

  setUserId: (userId) ->
    localStorage.setItem("#{@namespace}.userId", userId)

    analytics = @getAnalytics()
    analytics.identify({userId: userId})

    analytics.track({
      userId: userId,
      event: 'Activate',
      properties: {
        category: 'Atom',
        label: @pkgVersion
      }
    })

  getAnalytics: ->
    @analytics ?= new Analytics(@analyticsWriteKey)

    if not @getUserId()
      @setUserId(uuid.v4())

    return @analytics

  trackCommand: (commandName) ->
    if not @enabled()
      return

    analytics = @getAnalytics()
    userId = @getUserId()

    analytics.identify({userId: userId})

    analytics.track({
      userId: userId,
      event: 'Run Command',
      properties: {
        category: 'Atom',
        label: commandName
      }
    })
