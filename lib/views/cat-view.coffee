{CompositeDisposable} = require 'atom'
{ScrollView} = require 'atom-space-pen-views'

module.exports =
  class CatView extends ScrollView
    @content: (params)->
      @div class: "padded", =>
        @div class: "inset-panel", =>
          @div class: "panel-heading", =>
            @span class: "icon icon-octoface"
            @span class: "", "Elasticsearch: "
            @span class: "text-highlight", "#{params.title}"
          @div class: "panel-body padded elasticsearch-cat-panel", =>
            @pre =>
              @code class: "message"

    initialize: ->
      super
      @disposables = new CompositeDisposable
      @panel ?= atom.workspace.addBottomPanel(item: this)
      @disposables.add atom.commands.add(
        'atom-text-editor', 'core:cancel': => @destroy())

    updateMessage: (message) ->
      @find(".message").text(message)

    destroy: ->
      @disposables?.dispose()
      @panel?.destroy()
