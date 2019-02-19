component{

	property name="recaptchaService" inject="RecaptchaService@recaptcha";

	function index( event, rc, prc ){
		event.setView( "main/index" );
	}

	/**
	* validate
	*/
	function validate( event, rc, prc ){
		var isValid = recaptchaService.isValid( rc[ "g-recaptcha-response" ] );
		return {
			"isValid" : isValid
		};
	}

}