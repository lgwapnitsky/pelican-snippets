PelicanSnippetsView = require './pelican-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = PelicanSnippets =
  pelicanSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @pelicanSnippetsView = new PelicanSnippetsView(state.pelicanSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @pelicanSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'pelican-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @pelicanSnippetsView.destroy()

  serialize: ->
    pelicanSnippetsViewState: @pelicanSnippetsView.serialize()

  toggle: ->
    console.log 'PelicanSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
