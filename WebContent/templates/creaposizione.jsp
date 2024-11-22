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
		<h1 class="form-title" style="font-size:2.5vw;">Crea una posizione</h2>
		<form action="${pageContext.request.contextPath}/inviaPosizione" method="post">
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
					<select id="provincia-input" name="provinciaupdateRegione" class="form-select"
						required onchange="updateRegione()">
						<option value="">-- Seleziona Provincia --</option>
						<c:forEach var="province" items="${provinceList}">
							<option value="${province}"
								${province == selectedProvincia ? 'selected' : ''}>${province}</option>
						</c:forEach>
					</select>
					
					<select id="regione-input" name="regione" class="form-select"
						disabled style="appearance: none; -webkit-appearance: none; -moz-appearance: none;">
                        <option value="">-- Regione --</option>
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region}" ${region == selectedRegione ? 'selected' : ''}>${region}</option>
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
	
    const provinciaToRegioneMap = {
            "Chieti": "Abruzzo",
            "L'Aquila": "Abruzzo",
            "Pescara": "Abruzzo",
            "Teramo": "Abruzzo",
            "Potenza": "Basilicata",
            "Matera": "Basilicata",
            "Catanzaro": "Calabria",
            "Cosenza": "Calabria",
            "Crotone": "Calabria",
            "Reggio Calabria": "Calabria",
            "Vibo Valentia": "Calabria",
            "Avellino": "Campania",
            "Benevento": "Campania",
            "Caserta": "Campania",
            "Napoli": "Campania",
            "Salerno": "Campania",
            "Bologna": "Emilia-Romagna",
            "Ferrara": "Emilia-Romagna",
            "Forlì-Cesena": "Emilia-Romagna",
            "Modena": "Emilia-Romagna",
            "Parma": "Emilia-Romagna",
            "Piacenza": "Emilia-Romagna",
            "Ravenna": "Emilia-Romagna",
            "Reggio Emilia": "Emilia-Romagna",
            "Rimini": "Emilia-Romagna",
            "Gorizia": "Friuli-Venezia Giulia",
            "Pordenone": "Friuli-Venezia Giulia",
            "Trieste": "Friuli-Venezia Giulia",
            "Udine": "Friuli-Venezia Giulia",
            "Frosinone": "Lazio",
            "Latina": "Lazio",
            "Rieti": "Lazio",
            "Roma": "Lazio",
            "Viterbo": "Lazio",
            "Genova": "Liguria",
            "Imperia": "Liguria",
            "La Spezia": "Liguria",
            "Savona": "Liguria",
            "Bergamo": "Lombardia",
            "Brescia": "Lombardia",
            "Como": "Lombardia",
            "Cremona": "Lombardia",
            "Lecco": "Lombardia",
            "Lodi": "Lombardia",
            "Mantova": "Lombardia",
            "Milano": "Lombardia",
            "Monza e Brianza": "Lombardia",
            "Pavia": "Lombardia",
            "Sondrio": "Lombardia",
            "Varese": "Lombardia",
            "Ancona": "Marche",
            "Ascoli Piceno": "Marche",
            "Fermo": "Marche",
            "Macerata": "Marche",
            "Pesaro e Urbino": "Marche",
            "Campobasso": "Molise",
            "Isernia": "Molise",
            "Alessandria": "Piemonte",
            "Asti": "Piemonte",
            "Biella": "Piemonte",
            "Cuneo": "Piemonte",
            "Novara": "Piemonte",
            "Torino": "Piemonte",
            "Verbano-Cusio-Ossola": "Piemonte",
            "Vercelli": "Piemonte",
            "Bari": "Puglia",
            "Barletta-Andria-Trani": "Puglia",
            "Brindisi": "Puglia",
            "Foggia": "Puglia",
            "Lecce": "Puglia",
            "Taranto": "Puglia",
            "Cagliari": "Sardegna",
            "Nuoro": "Sardegna",
            "Oristano": "Sardegna",
            "Sassari": "Sardegna",
            "Sud Sardegna": "Sardegna",
            "Agrigento": "Sicilia",
            "Caltanissetta": "Sicilia",
            "Catania": "Sicilia",
            "Enna": "Sicilia",
            "Messina": "Sicilia",
            "Palermo": "Sicilia",
            "Ragusa": "Sicilia",
            "Siracusa": "Sicilia",
            "Trapani": "Sicilia",
            "Arezzo": "Toscana",
            "Firenze": "Toscana",
            "Grosseto": "Toscana",
            "Livorno": "Toscana",
            "Lucca": "Toscana",
            "Massa-Carrara": "Toscana",
            "Pisa": "Toscana",
            "Pistoia": "Toscana",
            "Prato": "Toscana",
            "Siena": "Toscana",
            "Bolzano": "Trentino-Alto Adige",
            "Trento": "Trentino-Alto Adige",
            "Perugia": "Umbria",
            "Terni": "Umbria",
            "Aosta": "Valle d'Aosta",
            "Belluno": "Veneto",
            "Padova": "Veneto",
            "Rovigo": "Veneto",
            "Treviso": "Veneto",
            "Venezia": "Veneto",
            "Verona": "Veneto",
            "Vicenza": "Veneto"
        };
	
    function goToListaDomande() {
        // Get the input values
        const titolo = encodeURIComponent(document.getElementById('titolo-input').value);
        const descrizione = encodeURIComponent(document.getElementById('descrizione-input').value);
        
        const provinciaSelect = document.getElementById('provincia-input');
        const provincia = provinciaSelect.value;

        const params = new URLSearchParams(window.location.search);
        const questions=params.getAll('question');
        
        const baseUrl = '${pageContext.request.contextPath}/listadomande';
        const urlWithParams = baseUrl+'?titolo='+titolo+'&descrizione='+descrizione+'&provincia='+provincia+'&'+questions.map(q => 'question=' + q).join('&');
        
        location.href = urlWithParams;
    }

        document.addEventListener('DOMContentLoaded', () => {
            const provinciaSelect = document.getElementById('provincia-input');
            const regioneSelect = document.getElementById('regione-input');

            provinciaSelect.addEventListener('change', () => {
                const provincia = provinciaSelect.value;

                if (provincia && provinciaToRegioneMap[provincia]) {
                    regioneSelect.value = provinciaToRegioneMap[provincia];
                } else {
                    regioneSelect.value = "";
                }
            });
        });
        
        
        function setProvincia() {
        const urlParams = new URLSearchParams(window.location.search);
        const provincia = urlParams.get('provincia');

        console.log(provincia);

        const provinciaSelect = document.getElementById('provincia-input');
        
        if (provincia && provinciaSelect) {
        	provinciaSelect.value=provincia;
        	const regioneSelect = document.getElementById('regione-input');
        	regioneSelect.value = provinciaToRegioneMap[provincia];
        } 
        }
        window.addEventListener('popstate', setProvincia);
        window.addEventListener('load', setProvincia);


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
