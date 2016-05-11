component accessors="true" implements="cbvalidation.models.validators.IValidator" hint="Validates Google Recaptcha" singleton {

    property name="name";
    property name="API" inject="API@recaptcha";

    IValidator function init(){
        name        = "Recaptcha";
        return this;
    }

    /**
    * Will check if an incoming value validates
    * @validationResult.hint The result object of the validation
    * @target.hint The target object to validate on
    * @field.hint The field on the target object to validate on
    * @targetValue.hint The target value to validate
    * @validationData.hint The validation data the validator was created with
    */
    boolean function validate(required cbvalidation.models.result.IValidationResult validationResult, required any target, required string field, any targetValue, any validationData){
        local.result = API.isValid( arguments.targetValue?:"" );

        if( !local.result ){
            var args = {message="You must prove you are not a robot!",field=arguments.field,validationType=getName(),validationData=arguments.validationData,rejectedValue=arguments.targetValue};
            validationResult.addError( validationResult.newError(argumentCollection=args) );
            return false;
        }

        return true;
    }

    string function getName(){
        return name;
    }
}