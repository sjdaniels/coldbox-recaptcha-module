<cfscript>
	param name="args.size" default="normal"; // normal, or compact

	if( isNull( prc.recaptcha_inited ) ){
		html.addAsset( "https://www.google.com/recaptcha/api.js" );
		prc.recaptcha_inited = true;
	}
</cfscript>
<cfoutput>
	<div
		class="g-recaptcha"
		data-sitekey="#getModuleSettings( "recaptcha2" ).publicKey#"
		data-size="#args.size#"
	></div>
</cfoutput>