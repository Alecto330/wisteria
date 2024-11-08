<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_signup.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style.css">
</head>
<body>

    <%@ include file="header.jsp"%>

    <div class="login-container">
        <h2>Registrati!</h2>
        <form id="signupForm" action="" method="POST" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="nome">Nome</label>
                    <input type="text" class="form-control" id="nome" name="nome"
                        placeholder="Inserisci il tuo nome" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="cognome">Cognome</label>
                    <input type="text" class="form-control" id="cognome" name="cognome"
                        placeholder="Inserisci il tuo cognome" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="dataNascita">Data di Nascita</label>
                    <input type="date" class="form-control" id="dataNascita" name="dataNascita"
                        required>
                </div>
                <div class="form-group col-md-6">
                    <label for="codiceFiscale">Codice Fiscale</label>
                    <input type="text" class="form-control" id="codiceFiscale" name="codiceFiscale"
                        placeholder="Inserisci il tuo codice fiscale" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username"
                        placeholder="Inserisci il tuo username" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email"
                        placeholder="Inserisci la tua email" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password"
                        placeholder="Inserisci la tua password" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="confirmPassword">Conferma Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                        placeholder="Conferma la tua password" required>
                    <small id="passwordHelp" class="form-text text-danger" style="display: none;">Le password non corrispondono.</small>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block" id="submitBtn">Registrati</button>
        </form>
        <a href="${pageContext.request.contextPath}/login"
            class="register-link">Hai già un account? Accedi</a>
    </div>

    <div class="btn-container">
        <button class="btn btn-back" onclick="history.back()">← Torna
            Indietro</button>
    </div>

    <%@ include file="footer.jsp"%>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const signupForm = document.getElementById('signupForm');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            const passwordHelp = document.getElementById('passwordHelp');

            function validatePassword() {
                if (password.value === confirmPassword.value && password.value !== "") {
                    passwordHelp.style.display = 'none';
                } else {
                    passwordHelp.style.display = 'block';
                }
            }

            password.addEventListener('input', validatePassword);
            confirmPassword.addEventListener('input', validatePassword);

            signupForm.addEventListener('submit', function(event) {
                if (password.value !== confirmPassword.value) {
                    event.preventDefault();
                    passwordHelp.style.display = 'block';
                    alert('Le password non corrispondono. Per favore, riprova.');
                }
            });
        });
    </script>

</body>
</html>
