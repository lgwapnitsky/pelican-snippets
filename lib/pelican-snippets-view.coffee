# {TextEditorView} = require 'atom-space-pen-views'
{$} = require 'atom-space-pen-views'
{$, View} = require 'space-pen'

module.exports =
class pelicanSnippetsView extends View
  @content: ->
    @div class: 'pelican-snippets overlay from-top', =>
      @div "The pelicanSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: ->
    atom.commands.add @element,
    'pelican-snippets:toggle', => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
