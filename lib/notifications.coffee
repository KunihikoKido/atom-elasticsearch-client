module.exports =
  title: 'Elasticsearch-Client'
  addInfo: (message, {dismissable}={}) ->
    atom.notifications.addInfo(
      @title, detail: message, dismissable: dismissable)

  addSuccess: (message, {dismissable}={}) ->
    atom.notifications.addSuccess(
      @title, detail: message, dismissable: dismissable)

  addError: (message, {stack, dismissable}={}) ->
    atom.notifications.addError(
      @title, detail: message, stack: stack, dismissable: dismissable)
