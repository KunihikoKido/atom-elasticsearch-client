{CompositeDisposable} = require 'atom'
{$, TextEditorView, View} = require 'atom-space-pen-views'

module.exports =
class InputView extends View
  @content: (placeholderText) ->
    @div =>
      @subview 'inputValue', new TextEditorView(mini: true, placeholderText: placeholderText)

  initialize: (placeholderText, @callback) ->
    @disposables = new CompositeDisposable
    @currentPane = atom.workspace.getActivePane()
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @inputValue.focus()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:cancel': => @destroy()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:confirm': => @confirm()

  confirm: ->
    text = @inputValue.getModel().getText()
    @callback?(text)
    @destroy()

  destroy: ->
    @disposables?.dispose()
    @panel?.destroy()
