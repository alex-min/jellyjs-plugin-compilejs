// Generated by CoffeeScript 1.6.2
var assert, e, jy, pluginDir, request, root, toType;

pluginDir = __dirname + '/../';

toType = function(obj) {
  return {}.toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
};

assert = require('chai').assert;

request = require('request');

try {
  jy = require('jellyjs');
} catch (_error) {
  e = _error;
  root = __dirname + '/../../../../';
  jy = require("" + root + "/index.js");
}

describe('#Plugin::compilejs', function() {
  it('Should compile js File entities', function(cb) {
    var jelly;

    jelly = new jy.Jelly();
    return jelly.boot({
      directory: "" + __dirname + "/demo",
      folderPlugins: [
        {
          name: 'compilejs',
          directory: pluginDir
        }
      ]
    }, function(err) {
      var content, file;

      if (err != null) {
        cb(err);
        cb = function() {};
        return;
      }
      file = jelly.getChildByIdRec('module1-file1.js');
      content = file.getCurrentContent();
      assert.equal(toType(content), 'object');
      assert.equal(content.extension, '__exec');
      assert.equal(toType(content.content), 'object');
      assert.equal(content.content.TEST, 1);
      return cb();
    });
  });
  it('Should raise an error if the file is invalid', function(cb) {
    var jelly;

    jelly = new jy.Jelly();
    return jelly.boot({
      directory: "" + __dirname + "/demoInvalidFile",
      folderPlugins: [
        {
          name: 'compilejs',
          directory: pluginDir
        }
      ]
    }, function(err) {
      if (err != null) {
        cb();
        cb = function() {};
        return;
      }
      return cb('No errors returned');
    });
  });
  return it('Should raise an error if the plugin is not used on Files', function(cb) {
    var jelly;

    jelly = new jy.Jelly();
    return jelly.boot({
      directory: "" + __dirname + "/demoInvalidPluginUsage",
      folderPlugins: [
        {
          name: 'compilejs',
          directory: pluginDir
        }
      ]
    }, function(err) {
      if (err != null) {
        cb();
        cb = function() {};
        return;
      }
      return cb('No errors returned');
    });
  });
});
