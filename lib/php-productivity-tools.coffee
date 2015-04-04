composerJsonReader = require './composer-json-reader'
psr4 = require './psr4'

module.exports =
  activate: ->
    atom.workspaceView.command "php-productivity-tools:insert-namespace", => @insertNamespace()
  insertNamespace: ->
    editor = atom.workspace.activePaneItem
    composerJsonReader.findInDirectories atom.project.getPaths(), (base, composerConf) ->
      namespace = psr4.pathToNamespace base, composerConf?.autoload['psr-4'], editor?.buffer.file?.path
      if namespace
        editor.insertText 'namespace ' + namespace + ';\n'
