<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Font-Awesome per le icone (senza doverle scaricare) -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
        rel="stylesheet">
    <!-- Per importare il font Poppins -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_login.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_nav.css">

    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">

    <!-- CSS per la alert box personalizzata -->
    <style>
        .alert-box {
            display: none;
            position: fixed;
            top: 10%;
            left: 50%;
            transform: translateX(-50%) translateY(-100%);
            background-color: #f44336;
            color: #fff;
            padding: 20px 25px;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            z-index: 1000;
            opacity: 0;
            transition: all 0.5s ease-in-out;
            text-align: center;
            cursor: pointer; /* Permette di chiudere l'alert cliccandoci sopra */
        }

        .alert-box.success {
            background-color: #4caf50;
        }

        .alert-box.show {
            display: block;
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
    </style>
</head>

<body>

    <!-- Alert Box Personalizzata -->
    <div class="alert-box" id="alertBox"></div>

    <%@ include file="header.jsp"%>
    <div class="login-container">
        <h2>Bentornato!</h2>
        <form id="loginForm" action="${pageContext.request.contextPath}/login"
            method="POST">

            <label for="email">Email</label>
            <input type="email" id="email"
                name="email" value="${email}" placeholder="Inserisci la tua mail"
                required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="${password}"
                placeholder="Inserisci la tua password" required>

            <button type="submit">Accedi</button>
        </form>
        <a href="${pageContext.request.contextPath}/register"
            class="register-link">Registrati</a>
    </div>

    <div class="btn-container">
        <button class="btn btn-back" onclick="history.back()">← Torna
            Indietro</button>
    </div>


    <script type="text/javascript">
        window.addEventListener('load', function() {
            const error = "<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>";
            if (error && error.trim() !== "") {
                showAlert(error, false);
            }

            const success = "<%= request.getAttribute("success") != null ? request.getAttribute("success") : "" %>";
            if (success && success.trim() !== "") {
                showAlert(success, true);
            }
        });

        /**
         * Mostra la alert box personalizzata.
         * @param {string} message - Il messaggio da visualizzare.
         * @param {boolean} isSuccess - Se true, applica lo stile di successo.
         */
        function showAlert(message, isSuccess) {
            const alertBox = document.getElementById('alertBox');
            alertBox.textContent = message;
            if (isSuccess) {
                alertBox.classList.add('success');
            } else {
                alertBox.classList.remove('success');
            }
            alertBox.classList.add('show');

            // Nasconde l'alert dopo 5 secondi
            setTimeout(() => {
                alertBox.classList.remove('show');
            }, 5000);

            // Permette di chiudere l'alert cliccandoci sopra
            alertBox.addEventListener('click', () => {
                alertBox.classList.remove('show');
            }, { once: true });
        }
    </script>


    <%@ include file="footer.jsp"%>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
