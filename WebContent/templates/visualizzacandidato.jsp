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
				<img id="profilePicture" src="" alt="Profile Picture"
					style="display: none; border-radius: 50%; width: 100%; height: 100%;">
				<div class="profile-icon-vc" id="profileIcon">
					<i class="fa-solid fa-user"></i>
				</div>
			</div>
			<div class="chiudi-posizione-container">
				<button class="chiudi-posizione" onclick="chiusura()">Chiudi
					posizione</button>
			</div>
		</div>

		<div class="content-grid">
			<div class="info-section">
				<div class="deatils-section">


					<div class="info-group">
						<div class="info-label">
							<i class="fa-solid fa-user"></i> Nome
						</div>
						<div class="info-value">${nome}${cognome}</div>
					</div>



					<div class="info-group">
						<div class="info-label">
							<i class="fas fa-envelope"></i> Email
						</div>
						<div class="info-value">
							<c:choose>
								<c:when test="${not empty email}">
                ${email}
            </c:when>
								<c:otherwise>
                Email non inserita
            </c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="info-group">
						<div class="info-label">
							<i class="fas fa-phone"></i> Telefono
						</div>
						<div class="info-value">
							<c:choose>
								<c:when test="${not empty telefono}">
                ${telefono}
            </c:when>
								<c:otherwise>
                Telefono non inserito
            </c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="info-group">
						<div class="info-label">
							<i class="fas fa-calendar-alt"></i> Data di nascita
						</div>
						<div class="info-value">
							<c:choose>
								<c:when test="${not empty dataDiNascita}">
                ${dataDiNascita}
            </c:when>
								<c:otherwise>
                Data di nascita non inserita
            </c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="info-group">
						<div class="info-label">
							<i class="fas fa-id-card"></i> Codice Fiscale
						</div>
						<div class="info-value">
							<c:choose>
								<c:when test="${not empty cf}">
                ${cf}
            </c:when>
								<c:otherwise>
                Codice fiscale non inserito
            </c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="info-group">
						<div class="info-label">
							<i class="fas fa-graduation-cap"></i> Titolo di Studio
						</div>
						<div class="info-value">
							<c:choose>
								<c:when test="${not empty titoloDiStudio}">
               						 ${titoloDiStudio}
            </c:when>
								<c:otherwise>
                Titolo di Studio non inserito
            </c:otherwise>
							</c:choose>
						</div>
					</div>


				</div>

				<div class="cv-section" onclick="handleClick()">
					<div class="folder-icon" id="icon">🚫</div>
					<div id="uploadText">CV non caricato</div>
				</div>
			</div>
			<div>
				<div class="experiences-section">
					<div class="section-header">
						<i class="fas fa-briefcase"></i>
						<h2 class="section-title esperienze-title">Esperienze</h2>
					</div>
					<div class="scrollable-experiences">
						<div class="experience-list">

							<c:forEach var="esperienza" items="${esperienze}">
								<div class="experience-item">
									<h3 class="experience-title">${esperienza.titolo}</h3>
									<p class="experience-description">${esperienza.esperienza}</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>


				<div class="experiences-section" style="margin-top: 40px;">
					<div class="section-header">
						<i class="fa-solid fa-lightbulb"></i>
						<h2 class="section-title esperienze-title">Soft-Skills</h2>
					</div>
					<div class="scrollable-experiences">
						<div class="experience-item softskill-item">
							<i
								class="${skill.skillOne ? 'fa-solid fa-check' : 'fa-solid fa-xmark'}"></i>
							<p class="experience-description">Comunicazione</p>
						</div>
						<div class="experience-item softskill-item">
							<i
								class="${skill.skillTwo ? 'fa-solid fa-check' : 'fa-solid fa-xmark'}"></i>
							<p class="experience-description">Teamwork</p>
						</div>
						<div class="experience-item softskill-item">
							<i
								class="${skill.skillThree ? 'fa-solid fa-check' : 'fa-solid fa-xmark'}"></i>
							<p class="experience-description">Organizzazione</p>
						</div>
						<div class="experience-item softskill-item">
							<i
								class="${skill.skillFour ? 'fa-solid fa-check' : 'fa-solid fa-xmark'}"></i>
							<p class="experience-description">Problem Solving</p>
						</div>
						<div class="experience-item softskill-item">
							<i
								class="${skill.skillFive ? 'fa-solid fa-check' : 'fa-solid fa-xmark'}"></i>
							<p class="experience-description">Competenze Sociali</p>
						</div>
					</div>
				</div>

			</div>

			<a class="back-button2" href="javascript:history.back();"> <i
				class="fas fa-arrow-left"></i>
			</a>
		</div>
	</div>

</body>

<script>

let pdfURL = null;

const base64PDF = '<%=request.getAttribute("pdfData") != null ? request.getAttribute("pdfData") : ""%>';

if (base64PDF) {
    const pdfBlob = new Blob([Uint8Array.from(atob(base64PDF), c => c.charCodeAt(0))], { type: 'application/pdf' });
    pdfURL = URL.createObjectURL(pdfBlob);
    
    document.getElementById('icon').textContent = "📄";  // Change icon
    document.getElementById('uploadText').textContent = "Apri CV";  // Change text
}

const base64Image = '<%=request.getAttribute("fotoProfiloData") != null ? request.getAttribute("fotoProfiloData") : ""%>';

if (base64Image) {
    const imageBlob = new Blob([Uint8Array.from(atob(base64Image), c => c.charCodeAt(0))], { type: 'image/jpeg' }); // Può essere 'image/png' o altro tipo di immagine
    const imageURL = URL.createObjectURL(imageBlob);
    const profilePicture = document.getElementById('profilePicture');
    profilePicture.src = imageURL;
    profilePicture.style.display = 'block';
    document.getElementById('profileIcon').style.display = 'none';
    document.querySelector('.camera-icon').style.display = 'none';
}


function handleClick() {
    if (pdfURL) {
        window.open(pdfURL, '_blank');
    }
}


	 function chiusura() {
        const urlParams = new URLSearchParams(window.location.search);
    	const idPosizione = urlParams.get('idPosizione');
		const username = urlParams.get('id');

        const formData = new URLSearchParams();
        formData.append('username', username);
        formData.append('idPosizione', idPosizione);

        console.log(formData.toString());

        fetch('/wisteria/visualizzacandidato', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData.toString()
        })
        .then(response => {
            if (response.redirected) {
                window.location.href = response.url;
            }
        })
        .then(data => {
            console.log('Esperienza aggiunta:', data);
        })
        .catch(error => {
            console.error('Errore aggiunta esperienza:', error);
        });
    }
</script>
</html>
