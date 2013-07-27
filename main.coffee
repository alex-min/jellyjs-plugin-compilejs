module.exports = {
  load: (cb) ->
    cb()
  oncall: (obj, params, cb) ->
    if obj.File != true
      cb(new Error("The compilejs plugin can only be called on Files"));
      return
    @getLogger().info("Compiling file '#{obj.getId()}'")
    content = obj.getCurrentContent()
    if content == null
      @getLogger().warn("No content found for ID '#{obj.getId()}'")
      cb()
    # ignoring non-js/json files because we cannot compile them
    if content.extension != 'js' && content.extension != 'json'
      cb()
      return
    obj.updateAndExecuteCurrentContent(cb)
  unload: (cb) ->
    cb()
}
