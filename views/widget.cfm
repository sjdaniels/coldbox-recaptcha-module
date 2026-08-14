<cfscript>
	param name="args.size" default="normal"; // normal, or compact
	param name="args.theme" default="light"; // light or dark
</cfscript>
<cfoutput>
	<cfif isnull( prc.recaptcha_inited )>
		<script type="text/javascript" src="#getModuleSettings( "recaptcha" ).scriptURL#" defer></script>
		<cfset prc.recaptcha_inited = true>
	</cfif>
	<div
		class="g-recaptcha"
		data-sitekey="#getModuleSettings( "recaptcha" ).publicKey#"
		data-size="#args.size#"
		data-theme="#args.theme#
	></div>
</cfoutput>
