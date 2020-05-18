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
    log message
    log signature
    log " - _ - "

    signer = crypto.createSign('sha256');
    signer.update(message);
    signer.end();

    signature = signer.sign(signingKey)
    signature_hex = signature.toString('hex')

    verifier = crypto.createVerify('sha256');
    verifier.update(message);
    verifier.end();

    verified = verifier.verify(verfificationKey, signature);

    log(JSON.stringify({message: message,signature: signature_hex,verified: verified,}, null, 4));

    log " - _ - "
    
    return

module.exports = authmodule