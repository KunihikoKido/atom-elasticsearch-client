Os = require 'os'
Path = require 'path'
fs = require 'fs-plus'
{allowUnsafeNewFunction} = require 'loophole'
CSV = require 'comma-separated-values'
{CreateCommand} = require './base'
InputView = require '../views/input-view'
config = require '../config'


module.exports =
  class HelperConvertCsvBulk extends CreateCommand
    fileName: "BULKINDEX.data"
    syntaxErrorMessage: "Syntax Error: invalid csv"

    isEnabled: ->
      text = @getText()
      try
        csv = new CSV(text, header:true)
      catch error
        return false
      return true


    run: ({uniqueField}={})->
      if uniqueField is undefined
        return new InputView(
          'Option: unique field name to index document (default: id)',
          (value) -> new HelperConvertCsvBulk(uniqueField: value))

      if not uniqueField
        uniqueField = "id"

      csv = new CSV(@getText(), header: true)
      rows = allowUnsafeNewFunction -> csv.parse()

      data = []
      for doc in rows
        action = {index: {}}
        if uniqueField in Object.keys(doc)
          action.index["_id"] = doc[uniqueField]
        data.push(JSON.stringify(action))
        data.push(JSON.stringify(doc))

      filePath = Path.join Os.tmpDir(), "#{@fileName}"
      fs.writeFileSync(filePath, data.join("\n"), flag: 'w+')

      split = if config.getOpenInPane() then config.getSplitPane()
      atom.workspace.open(filePath, split: split, activatePane: true)
