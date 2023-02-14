<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<form>
    <label for="username">Username:</label>
    <input type="text" id="username">
    <br><br>
    <label for="password">Password:</label>
    <input type="password" id="password">
    <br><br>
    <button id="submit">Submit</button>
</form>
<p class="error"></p>
</body>
</html>
<script>
    $(document).ready(function() {
        $("#submit").click(function() {
            var username = $("#username").val();
            var password = $("#password").val();

            if (username === "" || password === "") {
                $(".error").text("Please enter both a username and password.");
            } else {
                $(".error").text("");
                // Add your own logic for checking the username and password here
                // ...
                alert("Login successful!");
            }
        });
    });


</script>