<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/register.css">
    <title>Query Quest - Register</title>
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Let's create your account</h1>
    <p>Already a member? <a href="login.jsp" style="color: #893BAD">Sign in</a></p>
</div>

<div class="container">
    <h2>Register</h2>
    <form id="registrationForm" action="register" method="post" onsubmit="return validateForm()">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <div id="usernameError" class="error-message"></div>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <div id="passwordError" class="error-message"></div>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <div id="emailError" class="error-message"></div>

        <label for="contact">Contact:</label>
        <input type="tel" id="contact" name="contact" required>
        <div id="contactError" class="error-message"></div>

        <div class="checkbox-container">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Remember Me</label>
        </div>

        <div class="checkbox-container">
            <input type="checkbox" id="terms" name="terms" required>
            <label for="terms">I agree to the <a href="#" style="color: #893BAD">Terms & Conditions</a> and <a href="#" style="color: #893BAD">Privacy Policy</a></label>
        </div>

        <button type="submit">Register</button>

        <div id="formError" class="error-message">
            <% if (request.getAttribute("errorMessage") != null) { %>
            <%= request.getAttribute("errorMessage") %>
            <% } %>
        </div>
    </form>
</div>

<div class="footer">
    &copy; 2024 Query Quest. All rights reserved.
</div>

<script>
    function validateForm() {
        // Clear previous error messages
        document.getElementById('usernameError').innerText = '';
        document.getElementById('passwordError').innerText = '';
        document.getElementById('emailError').innerText = '';
        document.getElementById('contactError').innerText = '';
        document.getElementById('formError').innerText = '';

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const email = document.getElementById('email').value;
        const contact = document.getElementById('contact').value;
        const terms = document.getElementById('terms').checked;

        let isValid = true;

        // Validate fields
        const usernamePattern = /^[a-zA-Z0-9]+$/;
        if (!usernamePattern.test(username)) {
            document.getElementById('usernameError').innerText = 'Username must only contain alphanumeric characters.';
            isValid = false;
        }

        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{6,}$/;
        if (!passwordPattern.test(password)) {
            document.getElementById('passwordError').innerText = 'Password must be at least 6 characters long, contain one uppercase letter, one lowercase letter, and one special character.';
            isValid = false;
        }

        const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        if (!emailPattern.test(email)) {
            document.getElementById('emailError').innerText = 'Email must be a valid Gmail address.';
            isValid = false;
        }

        const contactPattern = /^\d{10}$/;
        if (!contactPattern.test(contact)) {
            document.getElementById('contactError').innerText = 'Contact number must be exactly 10 digits.';
            isValid = false;
        }

        if (!terms) {
            document.getElementById('formError').innerText = 'You must agree to the Terms & Conditions and Privacy Policy.';
            isValid = false;
        }

        // If initial validation is successful, check for existing email/contact
        if (isValid) {
            // Simulated existing email and contact (should be replaced with actual AJAX call)
            const existingEmails = ['souvik4920@gmail.com'];
            const existingContacts = ['8128490098'];

            if (existingEmails.includes(email) || existingContacts.includes(contact)) {
                document.getElementById('formError').innerText = 'User already exists with given details. Try logging in.';
                isValid = false;
            }
        }

        return isValid;
    }

    function clearErrorMessages() {
        // Clear all error messages
        document.getElementById('usernameError').innerText = '';
        document.getElementById('passwordError').innerText = '';
        document.getElementById('emailError').innerText = '';
        document.getElementById('contactError').innerText = '';
        document.getElementById('formError').innerText = '';
    }

    // Add event listeners to input fields to clear error messages on focus
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('focus', () => clearErrorMessages());
    });
</script>
</body>
</html>


