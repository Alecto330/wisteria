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
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
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
<body>

	<%@ include file="header.jsp"%>
	<div class="login-container">
		<h2>Bentornato!</h2>
		<form id="loginForm" action="${pageContext.request.contextPath}/login"
			method="POST">

			<label for="email">Email</label> <input type="email" id="email"
				name="email" value="${email}" placeholder="Inserisci la tua mail"
				required> <label for="password">Password</label> <input
				type="password" id="password" name="password" value="${password}"
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
            alert(error);
        }
    });
    </script>


	<%@ include file="footer.jsp"%>

</body>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</html>