module.exports =
  okCancel: (message, {okTitle}={}) ->
    okTitle = if okTitle then okTitle else "OK"
    buttons = ["Cancel", okTitle]
    OK = buttons.indexOf(okTitle)
    answer = atom.confirm(message: message, buttons: buttons)
    if answer is OK
      return true
    return false
