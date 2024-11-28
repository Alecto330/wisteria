<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_visualizzacandidato.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_profilepage.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
</head>
<body>

	<div class="main-container-visualizzacandidator">
		<div class="user-profile">
			<div class="profile-image">
				<div class="profile-icon">
					<i class="fa-solid fa-user"></i>
				</div>
			</div>
			<div class="chiudi-posizione-container">
				<button class="chiudi-posizione" onclick="chiusura(>${username})">Chiudi posizione</button>
			</div>
		</div>

		<div class="content-grid">
			<div class="info-section">
				<h2 class="section-title">Informazioni dell'utente:</h2>

				<div class="info-group">
					<div class="info-label">Email:</div>
					<div class="info-value">${email}</div>
				</div>

				<div class="info-group">
					<div class="info-label">Telefono:</div>
					<div class="info-value">${telefono}</div>
				</div>

				<div class="info-group">
					<div class="info-label">Data di nascita:</div>
					<div class="info-value">${dataDiNascita}</div>
				</div>

				<div class="info-group">
					<div class="info-label">Codice Fiscale:</div>
					<div class="info-value">${cf}</div>
				</div>

				<div class="info-group">
					<div class="info-label">Titolo:</div>
					<div class="info-value">${titoloDiStudio}</div>
				</div>

				<div class="cv-section">
					<div class="folder-icon">📁</div>
					<div>Visualizza CV</div>
				</div>
			</div>

			<div class="experiences-section">
				<h2 class="section-title">Esperienze</h2>
				<div class="scrollable-experiences">
					<div class="experience-list">

						<c:forEach var="esperienza" items="${esperienze}">
							<div class="experience-item">
								<h3 class="experience-title">${esperienza.titolo}:</h3>
								<p class="experience-description">${esperienza.esperienza}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<a class="back-button" href="javascript:history.back();"> <i
			class="fas fa-arrow-left"></i>
		</a>

	</div>

</body>
</html>
