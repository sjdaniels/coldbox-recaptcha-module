component {

	// Module Properties
	this.title 				= "recaptcha";
	this.author 			= "Sean Daniels";
	this.description 		= "Google Recaptcha Module";

	function configure(){

		settings = {
			apiUrl    = 'https://www.google.com/recaptcha/api/siteverify',
			secretKey = "",
			publicKey = ""
		};
	}
}
