<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
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
	href="${pageContext.request.contextPath}/static/style_visualizzacandidato.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_profilepage.css">
<title>Profilo Utente</title>
</head>
<body>


	<%@ include file="header.jsp"%>
	
	 <div class="main-container-visualizzacandidator">
        <div class="user-profile">
			<div class="profile-image">
				<div class="profile-icon">
					<i class="fa-solid fa-user"></i>
					<!-- Font Awesome user icon -->
				</div>

				<div class="camera-icon">
					<i class="fa-solid fa-plus"></i>
					<!-- Font Awesome plus icon -->
				</div>

			</div>
		</div>

        <div class="content-grid">
            <div class="info-section">
                <h2 class="section-title">Informazioni di contatto:</h2>
                
                <div class="info-group">
                    <div class="info-label">Email:</div>
                    <div class="info-value">can01email@wisteria.com</div>
                </div>

                <div class="info-group">
                    <div class="info-label">Telefono:</div>
                    <div class="info-value">+39 345 1232123</div>
                </div>

                <div class="info-group">
                    <div class="info-label">Data di nascita:</div>
                    <div class="info-value">16/05/1999</div>
                </div>

                <div class="info-group">
                    <div class="info-label">Codice Fiscale:</div>
                    <div class="info-value">LVNNTR99E16G942Y</div>
                </div>

                <div class="info-group">
                    <div class="info-label">Titolo:</div>
                    <div class="info-value">Diploma perito informatico</div>
                </div>
                
                <div class="cv-section">
                    <div class="folder-icon">📁</div>
                    <div>Carica il tuo CV</div>
                </div>
            </div>

            <div class="experiences-section ">
                <h2 class="section-title">Esperienze</h2>
                <div class="experience-list">
                    <div class="experience-item">
                        <h3 class="experience-title">Sviluppatore Software:</h3>
                        <p class="experience-description">
                            Progettazione e sviluppo di applicazioni web per clienti aziendali, con focus su 
                            soluzioni scalabili e ottimizzazione delle performance. Collaborazione con team 
                            multidisciplinari per garantire una user experience eccellente.
                        </p>
                    </div>

                    <div class="experience-item">
                        <h3 class="experience-title">System analyst:</h3>
                        <p class="experience-description">
                            Analisi delle esigenze aziendali e traduzione in requisiti tecnici per il 
                            miglioramento dei processi. Implementazione di sistemi ICT e monitoraggio delle 
                            prestazioni per massimizzare l'efficienza operativa.
                        </p>
                    </div>

                    <div class="experience-item">
                        <h3 class="experience-title">Sales Account:</h3>
                        <p class="experience-description">
                            Gestione di un portafoglio clienti, sviluppo di strategie di vendita e 
                            mantenimento di relazioni durature. Raggiungimento e superamento degli obiettivi 
                            di vendita attraverso presentazioni persuasive e analisi...
                        </p>
                    </div>
                </div>
            </div>
        </div>

        

        <button class="back-button">←</button>
    </div>
	
		<%@ include file="footer.jsp"%>

</body>
</html>