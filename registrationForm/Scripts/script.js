
<script>
    $(document).ready(function () {
        alert("jQuery is working!");
});
</script>


$(document).ready(function () {
    var passwordField = $(".password-field"); // Select using class
    var strengthIndicator = $("#password-strength");

    passwordField.on("keyup", function () {
        var password = $(this).val();
        var strengthText = "";
        var strengthColor = "";

        var hasNumbers = /\d/.test(password);
        var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        var hasUpperCase = /[A-Z]/.test(password);

        if (password.length < 6) {
            strengthText = "Very Weak";
            strengthColor = "red";
        } else if (password.length < 8) {
            strengthText = "Weak";
            strengthColor = "orangered";
        } else if (password.length >= 8 && (hasNumbers || hasSpecialChar)) {
            strengthText = "Medium";
            strengthColor = "orange";
        } else if (password.length >= 10 && hasNumbers && hasSpecialChar && hasUpperCase) {
            strengthText = "Strong";
            strengthColor = "green";
        } else {
            strengthText = "Good";
            strengthColor = "blue";
        }

        strengthIndicator.text(strengthText).css("color", strengthColor);
    });
});
