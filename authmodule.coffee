authmodule = {name: "authmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["authmodule"]?  then console.log "[authmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
authmodule.initialize = () ->
    log "authmodule.initialize"
    return

############################################################
authmodule.authenticate = (message, signature) ->
    log "authmodule.authenticate"
    return

module.exports = authmodule