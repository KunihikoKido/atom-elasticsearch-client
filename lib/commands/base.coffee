Os = require 'os'
Path = require 'path'
fs = require 'fs-plus'

notifications = require '../notifications'
config = require '../config'
CatView = require '../views/cat-view'
statusBarManager = require '../status-bar-manager'


resultJsonFilePath = Path.join Os.tmpDir(), "RESPONSE.json"

class BaseCommand
  baseUrl:    null
  index:      null
  docType:    null
  client:     null
  scroll:     null
  syntaxErrorMessage: "Syntax error: request body content is invalid json"

  constructor: (args...) ->
    @baseUrl          = config.getBaseUrl()
    @index            = config.getIndex()
    @docType          = config.getDocType()
    @client           = config.getClient()
    @scroll           = config.getScrollSize()

    @initialize?(args...)

  initialize: (args...) ->
    if @isEnabled()
      @run(args...)
      statusBarManager.update()
    else
      notifications.addError(@syntaxErrorMessage)

  isEnabled: ->
    text = @getText()
    try
      text = JSON.parse(text)
    catch error
      return false
    return true


  getText: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    text = editor.getSelectedText() or editor.getText()

  showResult: (error, response) ->
    if typeof response is 'object'
      response = JSON.stringify(response, null, '\t')

    fs.writeFileSync(resultJsonFilePath, response, flag: 'w+')

    split = if config.getOpenInPane() then config.getSplitPane()
    atom.workspace.open(resultJsonFilePath, split: split, activatePane: true)

  run: (args...) ->
    throw new Error("Subclass must implement a run(args...) method")


class CatBaseCommand extends BaseCommand

  isEnabled: ->
    return true

  getResponseView: ({title}={}) ->
    return new CatView(title: title)


class CreateCommand extends BaseCommand


class DeleteCommand extends CreateCommand
  confirm: true



module.exports.BaseCommand = BaseCommand
module.exports.CatBaseCommand = CatBaseCommand
module.exports.CreateCommand = CreateCommand
module.exports.DeleteCommand = DeleteCommand
