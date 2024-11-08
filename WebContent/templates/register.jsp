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
		<form id="signupForm" action="" method="POST">

			<!-- Campo Username Aggiunto -->
			<label for="username">Username</label> <input type="text"
				id="username" name="username"
				placeholder="Inserisci il tuo username" required> <label
				for="email">Email</label> <input type="email" id="email"
				name="email" placeholder="Inserisci la tua email" required>

			<label for="password">Password</label> <input type="password"
				id="password" name="password"
				placeholder="Inserisci la tua password" required> <label
				for="confirmPassword">Conferma Password</label> <input
				type="password" id="confirmPassword" name="confirmPassword"
				placeholder="Conferma la tua password" required>

			<button type="submit">Registrati</button>
		</form>
		<a href="${pageContext.request.contextPath}/login"
			class="register-link">Hai già un account? Accedi</a>
	</div>

	<div class="btn-container">
		<button class="btn btn-back" onclick="history.back()">← Torna
			Indietro</button>
	</div>

	<%@ include file="footer.jsp"%>


</body>
</html>