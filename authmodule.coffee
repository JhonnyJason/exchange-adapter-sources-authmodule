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
crypto = require("crypto")

############################################################
signingKey = ""
verfificationKey = ""


############################################################
authmodule.initialize = () ->
    log "authmodule.initialize"
    c = allModules.configmodule
    signingKey = c.requestSigningKey
    verfificationKey = c.requestVerificationKey
    return

############################################################
authmodule.authenticate = (message, signature) ->
    log "authmodule.authenticate"
    signatureBuffer = Buffer.from(signature, "base64")
    messageBuffer  = Buffer.from(message, 'utf8')

    verified = crypto.verify(null, messageBuffer, verfificationKey, signatureBuffer)
    log "verified is: " + verified
    
    if !verified then throw new Error("Invalid Signature!")
    return

authmodule.createSignature = (message) ->
    log "authmodule.createSignature"

    messageBuffer = Buffer.from(message, 'utf8')
    signature = crypto.sign(null, messageBuffer, signingKey)
    # log "signature is: " + signature.toString("base64")

    return signature


module.exports = authmodule