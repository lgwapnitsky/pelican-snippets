pelicanSnippets = require '../lib/pelican-snippets'
# {$} = require 'atom-space-pen-views'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "pelicanSnippets", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('pelican-snippets')
    activationPromise.fail (reason) ->
      throw reason

    jasmine.attachToDOM(workspaceElement)

  describe "when the pelican-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(workspaceElement.querySelector('.pelican-snippets')).not.toExist()

      atom.commands.dispatch workspaceElement, 'pelican-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.packages.isPackageActive('pelican-snippets')).toBe true
        atom.commands.dispatch workspaceElement, 'pelican-snippets:toggle'
        expect(workspaceElement.querySelector('.pelican-snippets')).not.toExist()
