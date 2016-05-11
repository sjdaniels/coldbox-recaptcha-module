<cfscript>
	param name="args.size" default="normal"; // normal, or compact

	if (!event.getValue("recaptcha_inited",false,true)) {
		html.addAsset("https://www.google.com/recaptcha/api.js");
		event.setValue("recaptcha_inited", true, true);
	}

	echo('<div class="g-recaptcha" data-sitekey="#getSetting("recaptcha").public_key#" data-size="#args.size#"></div>');
</cfscript>