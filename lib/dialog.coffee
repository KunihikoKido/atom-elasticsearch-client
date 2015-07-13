remote = require "remote"
dialog = remote.require "dialog"


module.exports =
  defaultPath: ""
  okCancel: (message, {okTitle}={}) ->
    okTitle = if okTitle then okTitle else "OK"
    buttons = [okTitle, "Cancel"]
    OK = buttons.indexOf(okTitle)
    answer = atom.confirm(message: message, buttons: buttons)
    if answer is OK
      return true
    return false

  saveDialog: ({defaultPath}={}) ->
    defaultPath ?= @defaultPath
    options =
      defaultPath: defaultPath
    fileNames = dialog.showSaveDialog(options)
    return fileNames

  openFile: ({defaultPath}={}) ->
    defaultPath ?= @defaultPath
    options =
      defaultPath: defaultPath
      properties: ["openFile"]
    fileNames = dialog.showOpenDialog(options)

    if fileNames is undefined
      return undefined
    return fileNames[0]
