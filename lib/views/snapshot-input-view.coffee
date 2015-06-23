{CompositeDisposable} = require 'atom'
{$, TextEditorView, View} = require 'atom-space-pen-views'

module.exports =
class SnapshotInputView extends View
  @content: ->
    @div =>
      @subview 'inputRepository', new TextEditorView(mini: true, placeholderText: 'Required: repository name')
      @subview 'inputSnapshot',   new TextEditorView(mini: true, placeholderText: 'Required: snapshot name')

  initialize: (@callback) ->
    @disposables = new CompositeDisposable
    @currentPane = atom.workspace.getActivePane()
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @inputRepository.focus()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:cancel': => @destroy()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:confirm': => @confirm()

  confirm: ->
    repository = @inputRepository.getModel().getText()
    snapshot   = @inputSnapshot.getModel().getText()
    @callback?(repository: repository, snapshot: snapshot)
    @destroy()

  destroy: ->
    @disposables?.dispose()
    @panel?.destroy()
