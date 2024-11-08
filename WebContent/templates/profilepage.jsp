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
			<div class="profile-image" onclick="triggerImageInput()">
				<input type="file" id="imageInput" accept="image/*" style="display: none;" onchange="handleImageChange(event)">
				<img id="profilePicture" src="" alt="Profile Picture" style="display: none; border-radius: 50%; width: 100%; height: 100%;">
				<div class="profile-icon" id="profileIcon">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="camera-icon">
					<i class="fa-solid fa-plus"></i>
				</div>
			</div>
		</div>

		<h2 class="form-title">Informazioni di contatto:</h2>

		<div class="form-grid">
			<div class="form-group">
				<label class="form-label">Nome:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="${nome}"> <span
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
					<input type="text" class="form-input" value="${username}">
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
					<input type="text" class="form-input" value="${cognome}"> <span
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
					<input type="text" class="form-input" value="${dataDiNascita}">
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
				<label class="form-label">Email:</label>
				<div class="form-input-wrapper">
					<input type="email" class="form-input" value="${email}"> <span
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
				<label class="form-label">Codice Fiscale:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="${cf}"> <span
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
				<label class="form-label">Telefono:</label>
				<div class="form-input-wrapper">
					<input type="tel" class="form-input" value="${telefono}"> <span
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
				<label class="form-label">Titolo:</label>
				<div class="form-input-wrapper">
					<input type="text" class="form-input" value="${titoloDiStudio}">
					<span class="edit-icon" title="Modifica"> <!-- SVG icona matita -->
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
			


			<div>
				<!-- Sezione per caricare il CV o aprirlo -->
				<div id="cvUploadSection" class="cv-upload" onclick="handleClick(event)">
					<input type="file" id="fileInput" accept="application/pdf" style="display: none;" onchange="handleFileChange(event)">
					<div class="cv-icon" id="icon">📁</div>
					<div id="uploadText">Carica il tuo CV</div>
					<div id="removePDF" onclick="removePDF(event)">❌</div>
				</div>
			</div>
			
			
			<script>
				let pdfURL = null;
			
				// Funzione per attivare il file input o aprire il PDF
				function handleClick(event) {
					// Se l'utente ha cliccato sulla "X", non aprire il PDF
					if (event.target.id === 'removePDF') return;
			
					if (pdfURL) {
						// Se il PDF è caricato, apri il PDF in una nuova scheda
						window.open(pdfURL, '_blank');
					} else {
						// Altrimenti, attiva il file input per caricare un PDF
						document.getElementById('fileInput').click();
					}
				}
			
				// Gestisce il cambiamento del file input
				function handleFileChange(event) {
					const file = event.target.files[0];
					
					if (file && file.type === 'application/pdf') {
						// Memorizza l'URL temporaneo per il PDF caricato
						pdfURL = URL.createObjectURL(file);
			
						// Modifica il testo e l'icona del div per aprire il PDF
						document.getElementById('icon').textContent = "📄";
						document.getElementById('uploadText').textContent = "Apri il tuo CV";
			
						// Mostra la "X" per rimuovere il PDF
						document.getElementById('removePDF').style.display = 'block';
					} else {
						alert("Per favore seleziona un file PDF.");
					}
				}
			
				// Funzione per rimuovere il PDF e permettere una nuova selezione del file
				function removePDF(event) {
					event.stopPropagation(); // Impedisce al click su "X" di attivare `handleClick`
			
					// Resetta l'URL del PDF
					pdfURL = null;
			
					// Ripristina l'aspetto del div per caricare il CV
					document.getElementById('icon').textContent = "📁";
					document.getElementById('uploadText').textContent = "Carica il tuo CV";
			
					// Nascondi la "X"
					document.getElementById('removePDF').style.display = 'none';
			
					// Resetta il campo file
					document.getElementById('fileInput').value = '';
				}






				function triggerImageInput() {
		document.getElementById('imageInput').click();
	}

	// Gestisce il caricamento dell'immagine
	function handleImageChange(event) {
		const file = event.target.files[0];
		
		if (file && file.type.startsWith('image/')) {
			const reader = new FileReader();

			// Quando l'immagine è pronta, la carica nel div .profile-image
			reader.onload = function(e) {
				const profilePicture = document.getElementById('profilePicture');
				profilePicture.src = e.target.result;
				profilePicture.style.display = 'block';

				// Nasconde le icone quando l'immagine è presente
				document.getElementById('profileIcon').style.display = 'none';
				document.querySelector('.camera-icon').style.display = 'none';
			};

			// Legge il file come URL data
			reader.readAsDataURL(file);
		} else {
			alert("Per favore seleziona un'immagine valida.");
		}
	}
			</script>
			
			
			
			
			
			


	
		
		
		






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

		<a class="back-button"> <i class="fas fa-arrow-left"></i>
		</a>
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