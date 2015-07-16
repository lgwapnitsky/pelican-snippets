PelicanShortcutsView = require './pelican-shortcuts-view'
{CompositeDisposable} = require 'atom'

module.exports = PelicanShortcuts =
  pelicanShortcutsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @pelicanShortcutsView = new PelicanShortcutsView(state.pelicanShortcutsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @pelicanShortcutsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'pelican-shortcuts:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @pelicanShortcutsView.destroy()

  serialize: ->
    pelicanShortcutsViewState: @pelicanShortcutsView.serialize()

  toggle: ->
    console.log 'PelicanShortcuts was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
