{$$, SelectListView} = require 'atom-space-pen-views'

module.exports =
class ListView extends SelectListView
  initialize: (@items, @onDone, @onCancel)->
    super
    @setItems(@items)
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @focusFilterEditor()

  getFilterKey: -> 'name'

  viewForItem: (item) ->
    $$ ->
      @li =>
        @div class: 'primary-line icon icon-database', "#{item.index}/#{item.docType}"
        @div class: 'secondary-line no-icon text-subtle', item.baseUrl

  hide: -> @panel?.hide()

  confirmed: (item) ->
    @onDone?(item)
    @hide()

  cancelled: ->
    @onCancel?()
    @hide()
