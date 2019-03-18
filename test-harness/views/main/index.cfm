<cfoutput>
#html.startForm(
	action = "main.validate"
)#
<h1>Recaptcha Validation</h1>

<!--- Recaptcha --->
#renderView(
	view   = "widget",
	module = "recaptcha",
	args   = {
		size = "normal"
	}
)#

<br>

#html.submitButton( name="submit" )#

#html.endForm()#
</cfoutput>