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
<body onmouseup="exit()">

	<%@ include file="header.jsp"%>

	<div class="main-container-profilepage">
		<div class="user-profile">
			<div class="profile-image" onclick="triggerImageInput()">
				<input type="file" id="imageInput" accept="image/*"
					style="display: none;" onchange="handleImageChange(event)">
				<img id="profilePicture" src="" alt="Profile Picture"
					style="display: none; border-radius: 50%; width: 100%; height: 100%;">
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
					<input id="input-nome" type="text" class="form-input" value="${nome}" disabled>
					<span id="modifica-nome" class="edit-icon" title="Modifica" onclick="toggleNome()"> 
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<path d="M12 20h9" />
							<path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
						</svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Username:</label>
				<div class="form-input-wrapper">
					<input id="input-username" type="text" class="form-input" value="${username}" disabled>
					<span id="modifica-username" class="edit-icon" title="Modifica" onclick="toggleUsername()">  
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Cognome:</label>
				<div class="form-input-wrapper">
					<input id="input-cognome" type="text" class="form-input" value="${cognome}" disabled>
					<span id="modifica-cognome" class="edit-icon" title="Modifica" onclick="toggleCognome()">
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
					<input id="input-datadinascita" type="date" class="form-input" value="${dataDiNascita}" disabled>
					<span id="modifica-datadinascita" class="edit-icon" title="Modifica" onclick="toggleDataDiNascita()"> 
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
					<input id="input-email" type="email" class="form-input" value="${email}" disabled>
					<span id="modifica-email" class="edit-icon" title="Modifica" onclick="toggleEmail()"> 
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
					<input id="input-cf" type="text" class="form-input" value="${cf}" disabled>
					<span id="modifica-cf" class="edit-icon" title="Modifica" onclick="toggleCF()"> 
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
					<input id="input-telefono" type="tel" class="form-input" value="${telefono}" disabled>
					<span id="modifica-telefono" class="edit-icon" title="Modifica" onclick="toggleTelefono()"> 
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label class="form-label">Titolo di studio:</label>
				<div class="form-input-wrapper">
					<input id="input-titolo" type="text" class="form-input" value="${titoloDiStudio}" disabled>
					<span id="modifica-titolo" class="edit-icon" title="Modifica" onclick="toggleTitoloDiStudio()"> 
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
				<div id="cvUploadSection" class="cv-upload"
					onclick="handleClick(event)">
					<input type="file" id="fileInput" accept="application/pdf"
						style="display: none;" onchange="handleFileChange(event)">
					<div class="cv-icon" id="icon">📁</div>
					<div id="uploadText">Carica il tuo CV</div>
					<div id="removePDF" onclick="removePDF(event)">❌</div>
				</div>
			</div>


			<script>

				// CARICA PDF CURRICULUM

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





				// CARICA IMMAGINE PROFILO
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

				// ###################### FUNZIONI PER MODIFICA CAMPI ##############################

					var nome = 0;
					var username = 0;
					var cognome = 0;
					var dataDiNascita = 0;
					var email = 0;
					var cf = 0;
					var telefono = 0;
					var titolo = 0;


					function toggleNome() {
						const input = document.getElementById('input-nome');
						const editIcon = document.getElementById('modifica-nome');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
						
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								nome=1;
							}
						});
						
						}

					function toggleUsername(){
						const input = document.getElementById('input-username');
						const editIcon = document.getElementById('modifica-username');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								username=1;
							}
						});
					}

					function toggleCognome(){
						const input = document.getElementById('input-cognome');
						const editIcon = document.getElementById('modifica-cognome');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								cognome=1;
							}
						});
					}

					function toggleDataDiNascita(){
						const input = document.getElementById('input-datadinascita');
						const editIcon = document.getElementById('modifica-datadinascita');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								dataDiNascita=1;
							}
						});
					}

					function toggleEmail(){
						const input = document.getElementById('input-email');
						const editIcon = document.getElementById('modifica-email');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								email=1;
							}
						});
						}

					function toggleCF(){
						const input = document.getElementById('input-cf');
						const editIcon = document.getElementById('modifica-cf');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								cf=1;
							}
						});
					}

					function toggleTelefono(){
						const input = document.getElementById('input-telefono');
						const editIcon = document.getElementById('modifica-telefono');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								telefono=1;
							}
						});
					}

					function toggleTitoloDiStudio(){
						const input = document.getElementById('input-titolo');
						const editIcon = document.getElementById('modifica-titolo');
						input.disabled = false; // Enable the input
						input.focus();
						editIcon.style.display ='none';
					
						// Optionally, disable editing again when the user clicks outside
						input.addEventListener('keydown', (event) => {
							if (event.key === 'Enter') {
								input.disabled = true; // Disable the input when Enter is pressed
								editIcon.style.display='inline';
								titolo=1;
							}
						});
					}
				
				  
			      
				  function exit(){

					exitNome();
					exitCognome();
					exitEmail();
					exitTelefono();
					exitUsername();
					exitDataDiNascita();
					exitCF();
					exitTitoloDiStudio();

			        }

					function exitNome(){
					  const input = document.getElementById('input-nome');
				      const editIcon = document.getElementById('modifica-nome');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitCognome(){
					  const input = document.getElementById('input-cognome');
				      const editIcon = document.getElementById('modifica-cognome');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitEmail(){
					  const input = document.getElementById('input-email');
				      const editIcon = document.getElementById('modifica-email');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitTelefono(){
					  const input = document.getElementById('input-telefono');
				      const editIcon = document.getElementById('modifica-telefono');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitUsername(){
					  const input = document.getElementById('input-username');
				      const editIcon = document.getElementById('modifica-username');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitDataDiNascita(){
					  const input = document.getElementById('input-datadinascita');
				      const editIcon = document.getElementById('modifica-datadinascita');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitCF(){
					  const input = document.getElementById('input-cf');
				      const editIcon = document.getElementById('modifica-cf');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
			        }

					function exitTitoloDiStudio(){
					  const input = document.getElementById('input-titolo');
				      const editIcon = document.getElementById('modifica-titolo');
			            input.disabled = true; // Disable the input when Enter is pressed
			            editIcon.style.display='inline';
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