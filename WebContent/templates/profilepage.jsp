<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
	href="${pageContext.request.contextPath}/static/style_profilepage.css">
<title>Profilo e personalizzazione</title>

</head>
<body>


	<%@ include file="header.jsp"%>

	<div class="main-container-profilepage">
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

		<h2 class="form-title">Informazioni di contatto:</h2>

		<div class="form-grid">
			<div class="form-group">
				<label class="form-label">Nome:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="Alessandro"> <span
						class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Username:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="CA_AlessandroRossi">
					<span class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Cognome:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="Rossi"> <span
						class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Data di nascita:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="14/05/2001"> <span
						class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Email:</label>
				<div class="form-input-wrapper">
					<input type="email" class="form-input"
						value="alessandrorossi@gmail.com"> <span class="edit-icon"
						title="Modifica"> <!-- SVG icona matita --> <svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Codice Fiscale:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="ROSALE80A01H501Z">
					<span class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Telefono:</label>
				<div class="form-input-wrapper">
					<input type="tel" class="form-input" value="+39 345 1234123">
					<span class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Titolo:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input"
						value="Diploma perito informatico"> <span
						class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
		</div>

		<div class="bottom-section">
			<div class="cv-upload">
				<div class="cv-icon">📁</div>
				<div>Carica il tuo CV</div>
			</div>

			<div class="experience-section">
				<div class="experience-header">
					<h3 class="experience-title">Aggiungi esperienza</h3>
				</div>

				<div class="form-group">
					<select class="form-input">
						<option value="" disabled selected>Titolo</option>
						<option>Sviluppatore Frontend</option>
						<option>Sviluppatore Backend</option>
						<option>Full Stack Developer</option>
						<option>UI Designer</option>
					</select>
				</div>

				<div class="form-group">
					<textarea class="form-input textarea-input"
						placeholder="Descrizione..."></textarea>
				</div>

				<button class="add-experience-btn">
					<i class="fas fa-plus"></i>
				</button>


				<!-- Lista delle esperienze predefinite -->
				<div class="experience-list">
					<div class="experience-item">
						<h4>Sviluppatore Frontend per ...</h4>
						<p>Responsabile della progettazione e implementazione di
							interfacce</p>
					</div>
					<div class="experience-item">
						<h4>Sviluppatore Backend presso...</h4>
						<p>Sviluppo e manutenzione di API RESTful.</p>
					</div>
					<div class="experience-item">
						<h4>Full Stack Developer presso Zucchetti</h4>
						<p>Gestione completa del ciclo di vita del software, dallo
							sviluppo frontend al backend.</p>
					</div>
				</div>
				<!-- Fine della lista delle esperienze -->
			</div>
		</div>

		<button class="back-button">←</button>
	</div>

	<script>
        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.querySelector('.edit-icon').style.opacity = '1';
            });
            
            input.addEventListener('blur', () => {
                input.parentElement.querySelector('.edit-icon').style.opacity = '0.7';
            });
        });
    </script>


	<%@ include file="footer.jsp"%>


</body>
</html>