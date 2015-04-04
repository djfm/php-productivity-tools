path = require 'path'

pathToNamespace = (root, mapping, filePath) ->
  return unless root and mapping and filePath
  dir = path.relative root, path.dirname filePath
  bestMatchingBase = null
  namespaceRoot = null
  namespacePath = null
  for namespace, base of mapping
    if 0 == dir.indexOf base
      if !bestMatchingBase or base.length > bestMatchingBase.length
        bestMatchingBase = base
        namespaceRoot = namespace
        namespacePath = dir.substring base.length
  if namespaceRoot and namespacePath
    namespaceRoot + namespacePath.replace '/', '\\'

exports.pathToNamespace = pathToNamespace
