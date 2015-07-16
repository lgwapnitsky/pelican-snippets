pelicanSnippetsView = require './pelican-snippets-view'

module.exports =
  pelicanSnippetsView: null

  activate: (state) ->
    @pelicanSnippetsView = new pelicanSnippetsView(state.pelicanSnippetsViewState)

  deactivate: ->
    @pelicanSnippetsView.destroy()

  serialize: ->
    pelicanSnippetsViewState: @pelicanSnippetsView.serialize()
