<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_profilepage.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
<title>Profilo e personalizzazione</title>
</head>
<body>

	<div class="alert-box success" id="successBox" onclick="hideSuccess()">Esperienza
		aggiunta con successo!</div>
	<div class="alert-box" id="alertBox" onclick="hideAlert()">Compila
		tutti i campi!</div>
	<div class="main-container-profilepage animate-on-scroll loader">
        <c:if test="${softskill == false}">
            <div class="soft-skills-banner">⚠️ Completa il test sulle Soft
                Skills per attirare l'attenzione dei recruiter!</div>
        </c:if>
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
			<div class="soft-skills-button-container">
				<c:if test="${softskill == false}">
					<button id="softSkillsTestButton" class="soft-skills-test-button"
						onclick="window.location.href='${pageContext.request.contextPath}/softskill?user=${username}'">
						Completa il Test Soft Skills</button>
				</c:if>


			</div>

		</div>
		<h2 class="form-title">Informazioni di contatto:</h2>
		<div class="form-grid">
			<div class="form-group">
				<label class="form-label">Nome</label>
				<div class="form-input-wrapper">
					<input id="input-nome" type="text" class="form-input"
						value="${nome}" disabled> <span id="modifica-nome"
						class="edit-icon" title="Modifica"
						onclick="toggleField('input-nome', 'modifica-nome', 'Nome')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Username</label>
				<div class="form-input-wrapper">
					<input id="input-username" type="text" class="form-input"
						value="${username}" disabled> <span id="modifica-username"
						class="edit-icon" title="Modifica"
						onclick="toggleField('input-username', 'modifica-username', 'Username')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Cognome</label>
				<div class="form-input-wrapper">
					<input id="input-cognome" type="text" class="form-input"
						value="${cognome}" disabled> <span id="modifica-cognome"
						class="edit-icon" title="Modifica"
						onclick="toggleField('input-cognome', 'modifica-cognome', 'Cognome')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Data di nascita</label>
				<div class="form-input-wrapper">
					<input id="input-datadinascita" type="date" class="form-input"
						value="${dataDiNascita}" disabled> <span
						id="modifica-datadinascita" class="edit-icon" title="Modifica"
						onclick="toggleField('input-datadinascita', 'modifica-datadinascita', 'DataDiNascita')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Email</label>
				<div class="form-input-wrapper">
					<input id="input-email" type="email" class="form-input"
						value="${email}" disabled> <span id="modifica-email"
						class="edit-icon" title="Modifica"
						onclick="toggleField('input-email', 'modifica-email', 'Email')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Codice Fiscale</label>
				<div class="form-input-wrapper">
					<input id="input-cf" type="text" class="form-input" value="${cf}"
						disabled> <span id="modifica-cf" class="edit-icon"
						title="Modifica"
						onclick="toggleField('input-cf', 'modifica-cf', 'CF')"> <svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Telefono</label>
				<div class="form-input-wrapper">
					<input id="input-telefono" type="tel" class="form-input"
						value="${telefono}" disabled> <span id="modifica-telefono"
						class="edit-icon" title="Modifica"
						onclick="toggleField('input-telefono', 'modifica-telefono', 'Telefono')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">Titolo di studio</label>
				<div class="form-input-wrapper">
					<input id="input-titolo" type="text" class="form-input"
						value="${titoloDiStudio}" disabled> <span
						id="modifica-titolo" class="edit-icon" title="Modifica"
						onclick="toggleField('input-titolo', 'modifica-titolo', 'Titolo')">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 20h9" />
                            <path
								d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z" />
                        </svg>
					</span>
				</div>
			</div>
		</div>
		<div class="form-grid">
			<div>
				<div id="cvUploadSection" class="cv-upload"
					onclick="handleClick(event)">
					<input type="file" id="fileInput" accept="application/pdf"
						style="display: none;" onchange="handleFileChange(event)">
					<div class="cv-icon" id="icon">📁</div>
					<div id="uploadText">Carica il tuo CV</div>
					<div id="removePDF" onclick="removePDF(event)" title="Rimuovi">❌</div>
				</div>
			</div>
			<script>
                let pdfURL = null;

                const base64PDF = '<%=request.getAttribute("pdfData") != null ? request.getAttribute("pdfData") : ""%>';

                if (base64PDF) {
                    const pdfBlob = new Blob([Uint8Array.from(atob(base64PDF), c => c.charCodeAt(0))], { type: 'application/pdf' });
                    pdfURL = URL.createObjectURL(pdfBlob);
                    document.getElementById('icon').textContent = "📄";  // Change icon
                    document.getElementById('uploadText').textContent = "Apri il tuo CV";  // Change text
                    document.getElementById('removePDF').style.display = 'block';  // Show the remove button
                }

                // ########################### CARICA PDF CURRICULUM ######################################
                function handleClick(event) {
                    if (event.target.id === 'removePDF') return;

                    if (pdfURL) {
                        window.open(pdfURL, '_blank');
                    } else {
                        document.getElementById('fileInput').click();
                    }
                }

                function handleFileChange(event) {
                    const file = event.target.files[0];

                    if (file && file.type === 'application/pdf') {
                        pdfURL = URL.createObjectURL(file);

                        document.getElementById('icon').textContent = "📄";
                        document.getElementById('uploadText').textContent = "Apri il tuo CV";
                        document.getElementById('removePDF').style.display = 'block';
                        sendFileToServer(file);
                    } else {
                        showAlert("Per favore seleziona un file PDF valido!");
                    }
                }

                function sendFileToServer(file) {
                    const formData = new FormData();
                    formData.append('cv', file);

                    fetch('/wisteria/profilepage', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => {
                    	 if (response.redirected) {
                             window.location.href = response.url;
                         }
                    })
                    .then(data => {
                        console.log('File caricato con successo:', data);
                    })
                    .catch(error => {
                        console.error('Errore nel caricamento del file:', error);
                    });
                }

                function removePDF(event) {
                    event.stopPropagation();
                    pdfURL = null;
                    document.getElementById('icon').textContent = "📁";
                    document.getElementById('uploadText').textContent = "Carica il tuo CV";
                    document.getElementById('removePDF').style.display = 'none';
                    document.getElementById('fileInput').value = '';
                }

                // ##################################### CARICA IMMAGINE PROFILO ######################################
                const base64Image = '<%= request.getAttribute("fotoProfiloData") != null ? request.getAttribute("fotoProfiloData") : "" %>';

                if (base64Image) {
                    const imageBlob = new Blob([Uint8Array.from(atob(base64Image), c => c.charCodeAt(0))], { type: 'image/jpeg' }); // Può essere 'image/png' o altro tipo di immagine
                    const imageURL = URL.createObjectURL(imageBlob);
                    const profilePicture = document.getElementById('profilePicture');
                    profilePicture.src = imageURL;
                    profilePicture.style.display = 'block';
                    document.getElementById('profileIcon').style.display = 'none';
                    document.querySelector('.camera-icon').style.display = 'none';
                }

                function triggerImageInput() {
                    document.getElementById('imageInput').click();
                }

                function handleImageChange(event) {
                    const file = event.target.files[0];

                    if (file && file.type.startsWith('image/')) {
                        const reader = new FileReader();

                        reader.onload = function(e) {
                            const profilePicture = document.getElementById('profilePicture');
                            profilePicture.src = e.target.result;
                            profilePicture.style.display = 'block';
                            document.getElementById('profileIcon').style.display = 'none';
                            document.querySelector('.camera-icon').style.display = 'none';
                        };
                        reader.readAsDataURL(file);
                        uploadImageToServer(file);
                    } else {
                        alert("Per favore seleziona un'immagine valida.");
                    }
                }

                function uploadImageToServer(file) {
                    const formData = new FormData();
                    formData.append('profileImage', file);
                    fetch('/wisteria/profilepage', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => {
                    	 if (response.redirected) {
                             window.location.href = response.url;
                         }
                    })
                    .then(data => {
                        console.log('Immagine caricata con successo:', data);
                    })
                    .catch(error => {
                        console.error('Errore nel caricamento dell\'immagine:', error);
                    });
                }

                // ####################################################################################

                // ###################### FUNZIONI PER MODIFICA CAMPI ##############################
                let params = new URLSearchParams();
                function toggleField(inputId, editIconId, paramName) {
                    const input = document.getElementById(inputId);
                    const editIcon = document.getElementById(editIconId);
                    let isFinalized = false;

                    input.disabled = false;
                    input.focus();
                    editIcon.style.display = 'none';
                    const handleKeydown = (event) => {
                        if (event.key === 'Enter' && !isFinalized) {
                            isFinalized = true;
                            finalizeEdit(inputId, editIconId, paramName);
                            input.removeEventListener('keydown', handleKeydown);
                            input.removeEventListener('blur', handleBlur);
                        }
                    };
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

                function finalizeEdit(inputId, editIconId, paramName) {
                    const input = document.getElementById(inputId);
                    const editIcon = document.getElementById(editIconId);

                    input.disabled = true;
                    editIcon.style.display = 'inline';

                    console.log(input.value.trim());

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
                        if (response.ok) {
                            location.reload();
                        }
                    })
                    .catch(error => {
                        console.error('Errore:', error);
                    });
                }

                function aggiungiEsperienza() {
                    const titoloEsperienza = document.getElementById('titolo-esperienza').value.trim();
                    const descrizioneEsperienza = document.getElementById('descrizione-esperienza').value.trim();
                    if (!titoloEsperienza || !descrizioneEsperienza) {
                        showAlert("Compila tutti i campi!");
                        return;
                    }
                    const formData = new URLSearchParams();
                    formData.append('titolo', titoloEsperienza);
                    formData.append('esperienza', descrizioneEsperienza);
                    console.log(formData.toString());

                    fetch('/wisteria/profilepage', {
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
                    document.getElementById('titolo-esperienza').value = '';
                    document.getElementById('descrizione-esperienza').value = '';
                }

                document.getElementById('modifica-nome').onclick = () => toggleField('input-nome', 'modifica-nome', 'Nome');
                // ####################################################################################################################

                function showAlert(message) {
                    const alertBox = document.getElementById('alertBox');
                    alertBox.textContent = message;
                    alertBox.classList.add('show');
                    setTimeout(() => {
                        hideAlert();
                    }, 3000);
                }

                function hideAlert() {
                    const alertBox = document.getElementById('alertBox');
                    alertBox.classList.remove('show');
                }
            </script>

			<div class="experience-section">
				<div class="experience-header">
					<h3 class="experience-title">Aggiungi esperienza</h3>
				</div>
				<div class="form-group">
					<input id="titolo-esperienza" class="form-input"
						placeholder="Titolo"></input>
				</div>
				<div class="form-group">
					<textarea id="descrizione-esperienza"
						class="form-input textarea-input" placeholder="Descrizione..."></textarea>
				</div>
				<button class="add-experience-btn" onclick="aggiungiEsperienza()">
					<i class="fas fa-plus"></i>
				</button>

				<div class="experience-list">
					<c:forEach var="esperienza" items="${esperienze}">
						<div class="experience-item">
							<div class="experience-header">
								<h4>${esperienza.titolo}</h4>
								<i class="fa fa-trash delete-icon"
									onclick="handleDelete(${esperienza.id})" title="Rimuovi"></i>
							</div>
							<p>${esperienza.esperienza}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<a class="back-button" href="/wisteria/home"> <i
			class="fas fa-arrow-left"></i>
		</a>
	</div>

	<script>
        function handleDelete(id) {
            const formData = new URLSearchParams();
            if (confirm("Sei sicuro di voler eliminare questo elemento?")) {
                console.log(id);
                formData.append('esperienzaId', id);
                console.log(formData.toString());
                fetch('/wisteria/profilepage', {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData.toString()
                })
                .then(response => {
                    if (response.ok) {
                        location.reload();
                    }
                })
                .catch(error => {
                    console.error("Errore:", error);
                });
            }
        }

        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.querySelector('.edit-icon').style.opacity = '1';
            });

            input.addEventListener('blur', () => {
                input.parentElement.querySelector('.edit-icon').style.opacity = '0.7';
            });
        });
    </script>
    <script>
			document.addEventListener("DOMContentLoaded", function () {
				const elements = document.querySelectorAll(".animate-on-scroll");

				const observer = new IntersectionObserver(
					(entries) => {
						entries.forEach((entry) => {
							if (entry.isIntersecting) {
								entry.target.classList.add("visible"); // Applica l'animazione
								observer.unobserve(entry.target); // Smetti di osservarlo dopo l'animazione
							}
						});
					},
					{ threshold: 0.0 } // Inizia l'animazione quando il 10% dell'elemento è visibile
				);

				elements.forEach((element) => observer.observe(element));
			});

	</script>
	<script>
			document.addEventListener("DOMContentLoaded", function () {
				const loader = document.querySelectorAll(".loader");

				const observer = new IntersectionObserver(
					(entries) => {
					entries.forEach((entry) => {
						if (entry.isIntersecting) {
						entry.target.classList.add("visible");
						} else {
						entry.target.classList.remove("visible");
						}
					});
					},
					{ threshold: 0.1 } // Attiva l'animazione quando il 40% è visibile
				);

				loader.forEach((card) => {
					card.classList.add("animate-on-scroll"); // Aggiunge lo stato iniziale
					observer.observe(card); // Osserva ogni card
				});
			});
	</script>
</body>
</html>
