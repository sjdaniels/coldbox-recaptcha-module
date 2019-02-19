component extends="coldbox.system.testing.BaseTestCase" appmapping="/"{

/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "Recaptcha 2", function(){

			beforeEach(function( currentSpec ){
			});


			it( "can render the widget", function(){
				var event = get( "/" );
				expect( event.getRenderedContent() ).toInclude( "g-recaptcha" );
			});

			it( "can validate the widget", function(){
				var event = post( route="/main/validate", params={
					"g-recaptcha-response" = "dataaaa"
				} );

				expect( event.getValue( "cbox_handler_results" ).isValid ).toBeFalse();
			});

		});

	}

}