<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap per gli elementi -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_creaposizione.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">

</head>
<body>


	<div class="main-container-creaposizione">
		<h1 class="form-title">Aggiungi posizione</h1>

<form id="creaPosizioneForm" action="${pageContext.request.contextPath}/creaposizione" method="POST">

		<div class="form-grid">
			<div class="form-group">
				<label class="form-label">Titolo:</label> <input name="titolo" type="text"
					class="form-input"
					placeholder="Inserisci il titolo della posizione">
			</div>

			<div class="form-group">
				<label class="form-label">Descrizione:</label> <input name="descrizione" type="text"
					class="form-input" placeholder="Inserisci la descrizione">
			</div>
		</div>

		<div class="form-group">
			<label class="form-label">Località:</label>
			<div class="location-group">
				<select name="regione" class="form-select">
					<c:forEach var="region" items="${regionList}">
						<option value="${region}">${region}</option>
					</c:forEach>
				</select> <select name="provincia" class="form-select">
					<c:forEach var="province" items="${provinceList}">
						<option value="${province}">${province}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="form-label">Settore:</label> <select name="professione"
				class="form-select">
				<c:forEach var="profession" items="${professionList}">
					<option value="${profession}">${profession}</option>
				</c:forEach>
			</select>
		</div>

		<div class="questions-section">
			<h3 class="questions-title">Aggiungi domanda</h3>
			<input type="text" class="question-input"
				placeholder="Quale KPI è fondamentale per un Sales Manager?">
			<button class="add-question-btn">+</button>
		</div>

		<button type="submit" class="create-btn">Crea</button>
		</form>
	</div>

</body>
</html>