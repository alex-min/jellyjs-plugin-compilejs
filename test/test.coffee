pluginDir = __dirname + '/../'
toType = (obj) -> ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
assert = require('chai').assert;
request = require('request')

try
  jy = require('jellyjs')
catch e
  root = __dirname + '/../../../../';
  jy = require("#{root}/index.js");

describe('#Plugin::compilejs', ->

  it('Should compile js File entities', (cb) ->
    jelly = new jy.Jelly()
    jelly.boot({
        directory:"#{__dirname}/demo"
        folderPlugins:[{name:'compilejs', directory:pluginDir}]
    }, (err) ->
      if err?
        cb(err); cb = ->
        return
      file = jelly.getChildByIdRec('module1-file1.js')
      content = file.getCurrentContent()
      assert.equal(toType(content), 'object')
      assert.equal(content.extension, '__exec')
      assert.equal(toType(content.content), 'object')
      assert.equal(content.content.TEST, 1)
      cb()
    )
  )
  it('Should raise an error if the file is invalid', (cb) ->
    jelly = new jy.Jelly()
    jelly.boot({
        directory:"#{__dirname}/demoInvalidFile"
        folderPlugins:[{name:'compilejs', directory:pluginDir}]
    }, (err) ->
      if err?
        cb(); cb = ->
        return
      cb('No errors returned')
    )
  )
  it('Should raise an error if the plugin is not used on Files', (cb) ->
    jelly = new jy.Jelly()
    jelly.boot({
        directory:"#{__dirname}/demoInvalidPluginUsage"
        folderPlugins:[{name:'compilejs', directory:pluginDir}]
    }, (err) ->
      if err?
        cb(); cb = ->
        return
      cb('No errors returned')
    )
  )
)