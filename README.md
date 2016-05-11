ColdBox ReCAPTCHA v2.0 Module
==============================
This module contains helpers for using Google's ReCAPTCHA API.

reCAPTCHA is a free service that protects your site from spam and abuse. It uses advanced risk analysis techniques to tell humans and bots apart. With the 2.0 API, a significant number of your valid human users will pass the reCAPTCHA challenge without having to solve a CAPTCHA. reCAPTCHA comes in the form of a widget that you can easily add to your blog, forum, registration form, etc.

##LICENSE
Apache License, Version 2.0.

##SYSTEM REQUIREMENTS
- Railo 4+
- ColdFusion 9+
- ColdBox 4+

---

#Instructions
Just drop into your `modules` folder or use the box-cli to install

`box install recaptcha2`

##USAGE
Get an API key pair at http://www.google.com/recaptcha/admin and add the following settings to your `Coldbox.cfc` under a `recaptcha` structure:

```js
// recaptcha settings
recaptcha = {
    private_key = "Secret key",
    public_key = "Site key",
};
```

In any form you wish to add the reCaptcha widget use `#renderview(view="widget",module="recaptcha")#`.

In your handler for the post of the form, or in a model object you can then use the included Validator. Here is an example of using it in a model object:

```js
    this.constraints = {
         "body" : { required:true }
        ,"recaptcha" : { validator:"id:Validator@recaptcha" }
    }
```

In the above example, your handler would just need to set the recaptcha property on the model object to the `g-recaptcha-response` value that is part of the form payload.

There also is a `API@recaptcha` Wirebox mapping you can use to validate manually if you prefer to not use the `cbvalidation` integration. In your handler:

```js
var recaptchaOK = getInstance("API@recaptcha").isValid( rc["g-recaptcha-response"] );

if (!recaptchaOK) {
    echo("Prove you have a soul!");
}
```