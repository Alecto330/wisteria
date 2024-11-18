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
<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
<title>Profilo e personalizzazione</title>

</head>
<body>

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
					<span id="modifica-nome" class="edit-icon" title="Modifica" onclick="toggleField('input-nome', 'modifica-nome', 'Nome')"> 
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
					<span id="modifica-username" class="edit-icon" title="Modifica" onclick="toggleField('input-username', 'modifica-username', 'Username')">  
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
					<span id="modifica-cognome" class="edit-icon" title="Modifica" onclick="toggleField('input-cognome', 'modifica-cognome', 'Cognome')">
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
					<span id="modifica-datadinascita" class="edit-icon" title="Modifica" onclick="toggleField('input-datadinascita', 'modifica-datadinascita', 'DataDiNascita')"> 
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
					<span id="modifica-email" class="edit-icon" title="Modifica" onclick="toggleField('input-email', 'modifica-email', 'Email')"> 
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
					<span id="modifica-cf" class="edit-icon" title="Modifica" onclick="toggleField('input-cf', 'modifica-cf', 'CF')"> 
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
					<span id="modifica-telefono" class="edit-icon" title="Modifica" onclick="toggleField('input-telefono', 'modifica-telefono', 'Telefono')"> 
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
					<span id="modifica-titolo" class="edit-icon" title="Modifica" onclick="toggleField('input-titolo', 'modifica-titolo', 'Titolo')"> 
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
					<input type="file" id="fileInput" accept="application/pdf" style="display: none;" onchange="handleFileChange(event)">
					<div class="cv-icon" id="icon">📁</div>
					<div id="uploadText">Carica il tuo CV</div>
					<div id="removePDF" onclick="removePDF(event)">❌</div>
				</div>
			</div>


			<script>
			let pdfURL = null;
			
			 const base64PDF = '<%= request.getAttribute("pdfData") != null ? request.getAttribute("pdfData") : "" %>';

		        if (base64PDF) {
		            // Convert Base64 string to Blob and create a temporary URL.
		            const pdfBlob = new Blob([Uint8Array.from(atob(base64PDF), c => c.charCodeAt(0))], { type: 'application/pdf' });
		            pdfURL = URL.createObjectURL(pdfBlob);
		            

		            // Trigger the handleFileChange-like functionality.
		            document.getElementById('icon').textContent = "📄";  // Change icon
		            document.getElementById('uploadText').textContent = "Apri il tuo CV";  // Change text
		            document.getElementById('removePDF').style.display = 'block';  // Show the remove button

		            // Optional: Display the PDF in a viewer or allow download.
		            const link = document.createElement('a');
		            link.href = pdfURL;
		            link.target = "_blank";
		            link.textContent = "Visualizza PDF";
		            document.body.appendChild(link);
		        }

				// ########################### CARICA PDF CURRICULUM ######################################



				// Funzione per gestire il click sul div di upload
				function handleClick(event) {
					if (event.target.id === 'removePDF') return;

					if (pdfURL) {
						window.open(pdfURL, '_blank');  // Apri il PDF in una nuova finestra
					} else {
						document.getElementById('fileInput').click();  // Mostra il file input per selezionare il PDF
					}
				}

				// Gestisce il cambiamento del file input
				function handleFileChange(event) {
					const file = event.target.files[0];

					if (file && file.type === 'application/pdf') {
						pdfURL = URL.createObjectURL(file);  // Crea l'URL temporaneo per il PDF

						document.getElementById('icon').textContent = "📄";  // Cambia l'icona
						document.getElementById('uploadText').textContent = "Apri il tuo CV";  // Modifica il testo
						document.getElementById('removePDF').style.display = 'block';  // Mostra il pulsante per rimuovere il file

						// Invia il file al server
						sendFileToServer(file);
					} else {
						alert("Per favore seleziona un file PDF.");  // Verifica che il file sia un PDF
					}
				}

				// Funzione per inviare il file al server usando FormData
				function sendFileToServer(file) {
					const formData = new FormData();
					formData.append('cv', file);  // Aggiungi il file al FormData con il nome del campo 'cv'

					fetch('/wisteria/profilepage', {
						method: 'POST',
						body: formData
					})
					.then(response => {
						if (!response.ok) {
							// Se la risposta del server non è ok, restituiamo un errore
							return response.text().then(err => {
								throw new Error(`Errore nel server: ${err}`);
							});
						}
						// Se la risposta è ok, ritorniamo la risposta come testo
						return response.text();
					})
					.then(data => {
						console.log('File caricato con successo:', data);  // data ora è una stringa, non un oggetto JSON
					})
					.catch(error => {
						console.error('Errore nel caricamento del file:', error);
					});
				}



				// Funzione per rimuovere il PDF
				function removePDF(event) {
					event.stopPropagation();

					pdfURL = null;

					document.getElementById('icon').textContent = "📁";  // Ripristina l'icona
					document.getElementById('uploadText').textContent = "Carica il tuo CV";  // Ripristina il testo
					document.getElementById('removePDF').style.display = 'none';  // Nascondi il pulsante
					document.getElementById('fileInput').value = '';  // Resetta il campo input
				}



				// #############################################################################################


				// ##################################### CARICA IMMAGINE PROFILO ######################################
									// Funzione per attivare l'input dell'immagine
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

							// Ora inviamo l'immagine al server
							uploadImageToServer(file);
						} else {
							alert("Per favore seleziona un'immagine valida.");
						}
					}

					// Funzione per caricare l'immagine al server
					function uploadImageToServer(file) {
						const formData = new FormData();
						formData.append('profileImage', file);  // Aggiungi l'immagine al FormData con il nome del campo 'profileImage'

						fetch('/wisteria/profilepage', {
							method: 'POST',
							body: formData
						})
						.then(response => {
							if (!response.ok) {
								return response.text().then(err => {
									throw new Error(`Errore nel server: ${err}`);
								});
							}
							return response.text();  // Gestiamo la risposta come testo
						})
						.then(data => {
							console.log('Immagine caricata con successo:', data);  // data sarà il testo di risposta dal server
						})
						.catch(error => {
							console.error('Errore nel caricamento dell\'immagine:', error);
						});
					}

				// ####################################################################################


				// ###################### FUNZIONI PER MODIFICA CAMPI ##############################
				let params = new URLSearchParams(); // Crea un oggetto URLSearchParams per gestire i parametri dell'URL

				// Funzione per attivare la modifica di un campo (input) al click sull'icona di modifica
				function toggleField(inputId, editIconId, paramName) {
				    const input = document.getElementById(inputId);
				    const editIcon = document.getElementById(editIconId);
				    let isFinalized = false; // Flag to prevent double execution

				    input.disabled = false;
				    input.focus();
				    editIcon.style.display = 'none';

				    // Gestisce la pressione del tasto "Enter" mentre si modifica il campo
				    const handleKeydown = (event) => {
				        if (event.key === 'Enter' && !isFinalized) {
				            isFinalized = true;
				            finalizeEdit(inputId, editIconId, paramName);
				            input.removeEventListener('keydown', handleKeydown);
				            input.removeEventListener('blur', handleBlur);
				        }
				    };

				    // Gestisce la perdita del focus (quando l'utente clicca fuori dal campo)
				    const handleBlur = () => {
				        if (!isFinalized) {
				            isFinalized = true;
				            finalizeEdit(inputId, editIconId, paramName);
				            input.removeEventListener('keydown', handleKeydown);
				            input.removeEventListener('blur', handleBlur);
				        }
				    };

				    input.addEventListener('keydown', handleKeydown);
				    input.addEventListener('blur', handleBlur);
				}

				// Funzione che finalizza la modifica, disabilita il campo e invia i dati al server
				function finalizeEdit(inputId, editIconId, paramName) {
				    const input = document.getElementById(inputId);
				    const editIcon = document.getElementById(editIconId);

				    input.disabled = true;
				    editIcon.style.display = 'inline';

				    if (input.value.trim() !== "") {
				        params.set(paramName, input.value.trim());
				    }

				    console.log(`Updated params: ${params.toString()}`);

				    const newUrl = `/wisteria/profilepage?${params.toString()}`;
				    window.history.pushState(null, '', newUrl);

				    const formData = new URLSearchParams(params).toString();
				    
				    fetch('/wisteria/profilepage', {
				        method: 'POST',
				        headers: {
				            'Content-Type': 'application/x-www-form-urlencoded',
				        },
				        body: formData,
				    })
				    .then(response => {
				        if (!response.ok) {
				            return response.text().then(err => {
				                throw new Error(`Server error: ${err}`);
				            });
				        }
				        return response.text();
				    })
				    .then(data => {
				        console.log('Dati aggiornati con successo:', data);
				    })
				    .catch(error => {
				        console.error('Errore:', error);
				    });
				}

				// Esempio di utilizzo per il campo "Nome"
				document.getElementById('modifica-nome').onclick = () => toggleField('input-nome', 'modifica-nome', 'Nome');

				// ####################################################################################################################


										
				
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