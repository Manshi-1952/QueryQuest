<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    <nav>
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><i>Query Quest</i></a>
            </div>
            <ul class="nav-links">
                <li><a href="questions.jsp">Questions</a></li>
                <li><a href="articles.jsp">Articles</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </div>
    </nav>

    <h2>Register</h2>

    <form id="registrationForm" action="register" method="post" onsubmit="return validateForm()">
        <label for="username">Username:</label><br>
        <div id="usernameError" class="error-message"></div>
        <input type="text" id="username" name="username" required onfocus="clearErrorMessage()"><br><br>

        <label for="password">Password:</label><br>
        <div id="passwordError" class="error-message"></div>
        <input type="password" id="password" name="password" required onfocus="clearErrorMessage()"><br><br>

        <label for="email">Email:</label><br>
        <div id="emailError" class="error-message"></div>
        <input type="email" id="email" name="email" required onfocus="clearErrorMessage()"><br><br>

        <label for="contact">Contact:</label><br>
        <div id="contactError" class="error-message"></div>
        <input type="tel" id="contact" name="contact" required onfocus="clearErrorMessage()"><br><br>

        <input type="checkbox" id="remember" name="remember">
        <label for="remember">Remember Me</label><br>

        <input type="checkbox" id="terms" name="terms" required>
        <label for="terms">I agree to the <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a></label><br>

        <button type="submit">Register</button>
        <!-- Display combined error message here -->
        <div id="formError" class="error-message">
            <% if (request.getAttribute("errorMessage") != null) { %>
            <%= request.getAttribute("errorMessage") %>
            <% } %>
        </div>
    </form>

    <header class="hero">
        <div class="container">
            <h1>Welcome to Query Quest</h1>
            <p>Your go-to place to ask questions and share knowledge</p>
        </div>
    </header>

    <footer>
        <div class="container">
            <p>&copy; 2024 Query Quest. All rights reserved.</p>
        </div>
    </footer>

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

