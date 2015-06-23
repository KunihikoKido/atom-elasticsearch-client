{CompositeDisposable} = require 'atom'
{$, TextEditorView, View} = require 'atom-space-pen-views'

module.exports =
class ScriptInputView extends View
  @content: ->
    @div =>
      @subview 'inputLang', new TextEditorView(mini: true, placeholderText: 'Required: script language')
      @subview 'inputId',   new TextEditorView(mini: true, placeholderText: 'Required: script id')

  initialize: (@callback) ->
    @disposables = new CompositeDisposable
    @currentPane = atom.workspace.getActivePane()
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @inputLang.focus()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:cancel': => @destroy()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:confirm': => @confirm()

  confirm: ->
    lang = @inputLang.getModel().getText()
    id   = @inputId.getModel().getText()
    @callback?(lang: lang, snapshot: id)
    @destroy()

  destroy: ->
    @disposables?.dispose()
    @panel?.destroy()
