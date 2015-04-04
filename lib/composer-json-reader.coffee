fs = require 'fs'
path = require 'path'

findInDirectories = (paths, onFound) ->
  tryPath = (pos) ->
    candidatePath = paths[pos]
    return unless candidatePath
    composerPath = path.join(candidatePath, 'composer.json')
    fs.exists composerPath, (yup) ->
      if yup
        fs.readFile composerPath, (err, data) ->
          unless err
            onFound (path.dirname composerPath), JSON.parse data.toString()
      else
        tryPath ++pos
  tryPath 0


exports.findInDirectories = findInDirectories
