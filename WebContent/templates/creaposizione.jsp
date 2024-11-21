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
<!-- Bootstrap per gli elementi -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font-Awesome per le icone (senza doverle scaricare) -->
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
		<h1 class="form-title">Crea una posizione</h1>
		<form action="${pageContext.request.contextPath}/inviaPosizione"
			method="post">
			<div class="form-group">
				<label class="form-label" for="titolo-input">Titolo:</label> <input
					name="titolo" type="text" class="form-input" id="titolo-input"
					value="${titolo}" placeholder="Inserisci il titolo della posizione" required>
			</div>

			<div class="form-group">
				<label class="form-label" for="descrizione-input">Descrizione:</label>
				<textarea name="descrizione" class="form-input"
					placeholder="Inserisci la descrizione" id="descrizione-input"
					rows="4" required>${descrizione}</textarea>
			</div>

			<div class="form-group">
				<label class="form-label" for="localita-input">Località:</label>
				<div class="location-group">
					<select id="regione-input" name="regione" class="form-select"
						required ${selectedRegione !=null&& !selectedRegione.isEmpty() ? 'disabled' : ''}>
                        <option value="">-- Seleziona Regione --</option>
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region}" ${region == selectedRegione ? 'selected' : ''}>${region}</option>
                        </c:forEach>
                    </select>

					<select id="provincia-input" name="provincia" class="form-select"
						required onchange="updateRegione()">
						<option value="">-- Seleziona Provincia --</option>
						<c:forEach var="province" items="${provinceList}">
							<option value="${province}"
								${province == selectedProvincia ? 'selected' : ''}>${province}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label" for="settore-input">Settore:</label>
				<div class="dropdown" id="settore-dropdown">
					<input id="settore-input" type="text"
						class="form-input dropdown-toggle"
						placeholder="Seleziona o digita un settore"
						aria-haspopup="listbox" aria-expanded="false" autocomplete="off"
						required>
					<ul class="dropdown-menu" role="listbox"
						aria-labelledby="settore-input">
						<c:forEach var="settore" items="${settoreList}">
							<li role="option" tabindex="0">${settore}</li>
						</c:forEach>
						<li role="option" tabindex="0">Opzione 1</li>
						<li role="option" tabindex="0">Opzione 2</li>
						<li role="option" tabindex="0">Opzione 3</li>
						<li role="option" tabindex="0">Opzione 4</li>
					</ul>
				</div>
			</div>
			<div class="questions-section">
				<h3 class="questions-title">Domande selezionate</h3>
				<ul class="selected-questions">
					<c:forEach var="domanda" items="${domande}">
						<li>${domanda.domanda} <span class="delete-btn"
							title="Elimina domanda">&times;</span>
						</li>
					</c:forEach>
				</ul>
				<button type="button" class="manage-questions-btn"
					onclick="goToListaDomande()"
					title="Aggiungi Domande">
					<i class="fas fa-plus"></i>
				</button>
			</div>
		</form>
	</div>

	<script>
	
    function goToListaDomande() {
        // Get the input values
        const titolo = encodeURIComponent(document.getElementById('titolo-input').value);
        const descrizione = encodeURIComponent(document.getElementById('descrizione-input').value);

        const params = new URLSearchParams(window.location.search);
        const questions=params.getAll('question');
        
        const baseUrl = '${pageContext.request.contextPath}/listadomande';
        const urlWithParams = baseUrl+'?titolo='+titolo+'&descrizione='+descrizione+'&'+questions.map(q => 'question=' + q).join('&');
        
        location.href = urlWithParams;
    }
	
        function updateRegione() {
            var provincia = document.getElementById('provincia-input').value;
            if (provincia) {
                window.location.href = '${pageContext.request.contextPath}/creaposizione?provincia=' + encodeURIComponent(provincia);
            } else {
                window.location.href = '${pageContext.request.contextPath}/creaposizione';
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            const dropdown = document.getElementById('settore-dropdown');
            const input = dropdown.querySelector('#settore-input');
            const list = dropdown.querySelector('.dropdown-menu');
            const items = Array.from(list.querySelectorAll('li'));
            let currentFocus = -1;
            input.addEventListener('focus', () => {
                list.style.display = 'block';
                input.setAttribute('aria-expanded', 'true');
            });

            document.addEventListener('click', (e) => {
                if (!dropdown.contains(e.target)) {
                    list.style.display = 'none';
                    input.setAttribute('aria-expanded', 'false');
                    currentFocus = -1;
                    removeActive();
                }
            });

            input.addEventListener('input', () => {
                const filter = input.value.toLowerCase();
                let visibleCount = 0;
                items.forEach(item => {
                    if (item.textContent.toLowerCase().includes(filter)) {
                        item.style.display = 'block';
                        visibleCount++;
                    } else {
                        item.style.display = 'none';
                    }
                });
                if (visibleCount > 0) {
                    list.style.display = 'block';
                    input.setAttribute('aria-expanded', 'true');
                } else {
                    list.style.display = 'none';
                    input.setAttribute('aria-expanded', 'false');
                }
                currentFocus = -1;
                removeActive();
            });

            items.forEach(item => {
                item.addEventListener('click', () => {
                    input.value = item.textContent;
                    list.style.display = 'none';
                    input.setAttribute('aria-expanded', 'false');
                    currentFocus = -1;
                    removeActive();
                });

                item.addEventListener('keydown', (e) => {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        item.click();
                    }
                });
            });

            input.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowDown') {
                    e.preventDefault();
                    currentFocus++;
                    addActive();
                } else if (e.key === 'ArrowUp') {
                    e.preventDefault();
                    currentFocus--;
                    addActive();
                } else if (e.key === 'Enter') {
                    e.preventDefault();
                    if (currentFocus > -1) {
                        items[currentFocus].click();
                    }
                }
            });

            function addActive() {
                if (currentFocus >= items.length) currentFocus = 0;
                if (currentFocus < 0) currentFocus = items.length - 1;
                removeActive();
                items[currentFocus].classList.add('active');
                items[currentFocus].scrollIntoView({ block: 'nearest' });
            }

            function removeActive() {
                items.forEach(item => item.classList.remove('active'));
            }

            const regioneSelect = document.getElementById('regione-input');
            const provinciaSelect = document.getElementById('provincia-input');

            function handleProvinciaChange() {
                if (provinciaSelect.value) {
                    updateRegione();
                } else {
                    regioneSelect.value = "";
                    regioneSelect.disabled = false;
                }
            }

            provinciaSelect.addEventListener('change', handleProvinciaChange);

            function initializeRegione() {
                var selectedRegione = '<c:out value="${selectedRegione}" />';
                if (selectedRegione && selectedRegione !== "") {
                    regioneSelect.value = selectedRegione;
                    regioneSelect.disabled = true;
                } else {
                    regioneSelect.value = "";
                    regioneSelect.disabled = false;
                }
            }

            initializeRegione();

            const deleteButtons = document.querySelectorAll('.delete-btn');
            deleteButtons.forEach(button => {
                button.addEventListener('click', (e) => {
                    const li = e.target.closest('li');
                    li.remove();
                });
            });
        });



         function inviaPosizione() {
            const titolo = document.getElementById('titolo-input').value.trim();
            const descrizione = document.getElementById('descrizione-input').value.trim();
            const regione = document.getElementById('regione-input').value;
            const provincia = document.getElementById('provincia-input').value;
            const settore = document.getElementById('settore-input').value.trim();

            if (!titolo || !descrizione || !regione || !provincia || !settore) {
                alert("Tutti i campi sono obbligatori!");
                return;
            }

            const params = new URLSearchParams({
                titolo: titolo,
                descrizione: descrizione,
                regione: regione,
                provincia: provincia,
                settore: settore
            });

            fetch('${pageContext.request.contextPath}/creaposizione', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString(),
            })
            .then(response => {
                if (!response.ok) {
                    return response.text().then(err => {
                        throw new Error(`Errore dal server: ${err}`);
                    });
                }
                return response.text();
            })
            .then(data => {
                console.log('Posizione salvata con successo:', data);
                window.location.href = '${pageContext.request.contextPath}/home';
            })
            .catch(error => {
                console.error('Errore:', error);
                alert("Si è verificato un errore durante la creazione della posizione.");
            });
        }
    </script>
</body>
</html>
