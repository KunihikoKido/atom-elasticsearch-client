{allowUnsafeNewFunction} = require 'loophole'
elasticsearch = allowUnsafeNewFunction -> require 'elasticsearch'
notifications = require '../notifications'
{DEFAULT_ANALYZERS} = require '../settings'



class BaseCommand
  namespace:  'elasticsearch-client'
  baseUrl:    null
  index:      null
  docType:    null
  client:     null
  apiVersion: null

  confirm: false
  confirmMessage: "Are you sure?"

  constructor: (args...) ->
    @baseUrl = @getBaseUrl()
    @index = @getIndex()
    @docType = @getDocType()
    @apiVersion = @getApiVersion()
    @client = @getClient(host: @baseUrl, apiVersion: @apiVersion)
    @analyzers = @getAnalyzers()

    @initialize?(args...)

  initialize: (args...) ->
    @runCommand(args...)

  getBaseUrl: ->
    atom.config.get("#{@namespace}.baseUrl")

  getIndex: ->
    atom.config.get("#{@namespace}.index")

  getDocType: ->
    atom.config.get("#{@namespace}.docType")

  getApiVersion: ->
    atom.config.get("#{@namespace}.apiVersion")

  getServers: ->
    atom.config.get("#{@namespace}.servers")

  getAnalyzers: ->
    analyzers = []

    items = atom.config.get("#{@namespace}.customAnalyzers")
    for item in items
      analyzers.push {name: "Custom Analyzer: #{item}", analyzer: item}

    analyzers.push.apply(analyzers, DEFAULT_ANALYZERS)

    return analyzers

  getClient: (options)->
    client = new elasticsearch.Client(options)

  setActiveServer: ({baseUrl, index, docType, apiVersion}={}) ->
    atom.config.set("#{@namespace}.baseUrl", baseUrl)
    atom.config.set("#{@namespace}.index", index)
    atom.config.set("#{@namespace}.docType", docType)
    atom.config.set("#{@namespace}.apiVersion", apiVersion)

  showActiveServer: ->
    notifications.addInfo("""
      baseUrl   : #{@getBaseUrl()}
      index     : #{@getIndex()}
      docType   : #{@getDocType()}
    """)


  getText: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    text = editor.getSelectedText() or editor.getText()

  showResult: (error, response) ->
    if error
      return notifications.addError("#{error}", dismissable: true)

    if typeof response is 'object'
      response = JSON.stringify(response, null, '\t')

    atom.workspace.open("Response", split: 'right').done () ->
      editor = atom.workspace.getActivePaneItem()
      editor.setGrammar(atom.grammars.grammarForScopeName('source.json'))
      editor.setText(response or '')

  isConfirmed: ->
    buttons = ["Cancel", "OK"]
    OK = buttons.indexOf("OK")

    if @confirm is false
      return true

    answer = atom.confirm(message: @confirmMessage, buttons: buttons)

    if answer is OK
      return true
    return false

  runCommand: (args...) ->
    if @isConfirmed()
      return @run(args...)

  run: (args...) ->
    throw new Error("Subclass must implement a run(args...) method")


class CatBaseCommand extends BaseCommand

  showResult: (error, response) ->
    if error
      return notifications.addError("#{error}", dismissable: true)

    notifications.addInfo("#{response}", dismissable: true)

class CreateCommand extends BaseCommand

  showResult: (error, response) ->
    if error
      return notifications.addError("#{error}", dismissable: true)

    if typeof response is 'object'
      response = JSON.stringify(response, null, '  ')

    notifications.addInfo(response, dismissable: false)

class DeleteCommand extends CreateCommand
  confirm: true



module.exports.BaseCommand = BaseCommand
module.exports.CatBaseCommand = CatBaseCommand
module.exports.CreateCommand = CreateCommand
module.exports.DeleteCommand = DeleteCommand
