component {

	property name="config" inject="coldbox:setting:recaptcha";

	boolean function isValid(required string response, string remoteIP=cgi.REMOTE_ADDR) {
		var exception = { type:"RecaptchaError" }
		var cfhttp = {}
		http url="https://www.google.com/recaptcha/api/siteverify" method="post" {
			httpparam type="formfield" name="response" value="#arguments.response#";
			httpparam type="formfield" name="remoteip" value="#arguments.remoteIP#";
			httpparam type="formfield" name="secret" value="#config.private_key#";
		}

		try {
			var result = deserializeJSON(cfhttp.filecontent);
		} catch (any local.e) {
			exception.message = "Deserialize Error"
			exception.detail = local.cfhttp.filecontent;
			throw(argumentCollection:exception);
		}

		return result.success;
	}

}