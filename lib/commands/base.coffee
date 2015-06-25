Os = require 'os'
Path = require 'path'
fs = require 'fs-plus'

notifications = require '../notifications'
config = require '../config'

resultJsonFilePath = Path.join Os.tmpDir(), "RESPONSE.json"

class BaseCommand
  namespace:  'elasticsearch-client'
  baseUrl:    null
  index:      null
  docType:    null
  client:     null
  apiVersion: null
  scroll: null

  confirmMessage: "Are you sure?"

  constructor: (args...) ->
    @baseUrl          = config.getBaseUrl()
    @index            = config.getIndex()
    @docType          = config.getDocType()
    @apiVersion       = config.getApiVersion()
    @client           = config.getClient()
    @scroll           = config.getScroll()

    @initialize?(args...)

  initialize: (args...) ->
    @run(args...)

  getText: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    text = editor.getSelectedText() or editor.getText()

  showResult: (error, response) ->
    if error
      return notifications.addError("#{error}", stack: error.stack, dismissable: true)

    if typeof response is 'object'
      response = JSON.stringify(response, null, '\t')

    fs.writeFileSync(resultJsonFilePath, response, flag: 'w+')

    split = if config.getOpenInPane() then config.getSplitPane()
    atom.workspace.open(resultJsonFilePath, split: split, activatePane: true)

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
