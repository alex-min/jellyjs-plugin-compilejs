// Generated by CoffeeScript 1.6.2
module.exports = {
  load: function(cb) {
    return cb();
  },
  oncall: function(obj, params, cb) {
    if (obj.File !== true) {
      cb(new Error("The compilejs plugin can only be called on Files"));
      return;
    }
    this.getLogger().info("Compiling file '" + (obj.getId()) + "'");
    return obj.updateAndExecuteCurrentContent(cb);
  },
  unload: function(cb) {
    return cb();
  }
};
