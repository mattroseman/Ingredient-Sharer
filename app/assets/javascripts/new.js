/**
 * Created by matt on 10/25/2016.
 */
$(document).ready(function() {
    console.log('javascript is loaded');

    $.validator.addMethod("password", function(value, element) {
        //  either this is an optional field, or there is one
        return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])$/i.test(value);
    }, "Passwords must contain upper-case letters, lower-case letters, and at least one number");

    $('new_user').validate({
        debug: true,
        rules: {
            "user[email]": {email: true},
            "user[password]": {minlength: 6, password: true},
            "user[password_confirmation]": {equalTo: "#user_password"}
        }
    });
});