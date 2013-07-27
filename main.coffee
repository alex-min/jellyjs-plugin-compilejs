module.exports = {
  load: (cb) ->
    cb()
  oncall: (obj, params, cb) ->
    if obj.File != true
      cb(new Error("The compilejs plugin can only be called on Files"));
      return
    @getLogger().info("Compiling file '#{obj.getId()}'")
    obj.updateAndExecuteCurrentContent(cb)
  unload: (cb) ->
    cb()
}
