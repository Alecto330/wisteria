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
    <!-- Alert Box Personalizzato -->
    <div id="alert-box" class="alert-box"></div>

    <div class="main-container-creaposizione animate-on-scroll loader">
        <h1 class="form-title">
            Crea una posizione
        </h1>
        <form action="${pageContext.request.contextPath}/creaposizione"
            method="POST" onsubmit="validate(event)">
            <div class="form-group">
                <label class="form-label" for="titolo-input">Titolo:</label>
                <input
                    name="titolo" type="text" class="form-input" id="titolo-input"
                    value="${titolo}"
                    placeholder="Inserisci il titolo della posizione" required>
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
                    <select id="provincia-input" name="provinciaupdateRegione"
                        class="form-select" required>
                        <option value="">-- Seleziona Provincia --</option>
                        <c:forEach var="province" items="${provinceList}">
                            <option value="${province}"
                                ${province == selectedProvincia ? 'selected' : ''}>${province}</option>
                        </c:forEach>
                    </select>
                    <select id="regione-input" name="regione" class="form-select"
                        disabled
                        style="appearance: none; -webkit-appearance: none; -moz-appearance: none;">
                        <option value="">-- Regione --</option>
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region}"
                                ${region == selectedRegione ? 'selected' : ''}>${region}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="form-label" for="settore-input">Settore:</label>
                <div class="dropdown" id="settore-dropdown">
                    <input id="settore-input" type="text" name="settore"
                        class="form-input dropdown-toggle"
                        placeholder="Seleziona o digita un settore"
                        aria-haspopup="listbox" aria-expanded="false" autocomplete="off"
                        required>
                    <ul class="dropdown-menu" role="listbox"
                        aria-labelledby="settore-input">
                        <c:forEach var="settore" items="${professionList}">
                            <li role="option" tabindex="0">${settore}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="questions-section">
                <h3 class="questions-title">Domande selezionate</h3>
                <ul class="selected-questions" id="selected-questions-list">
                    <c:forEach var="domanda" items="${domande}">
                        <li>
                            <input class="hide-value" name="domanda" value="${domanda.id}" type="hidden">
                            <span class="domanda-testo">${domanda.domanda}</span>
                            <span class="delete-btn" title="Elimina domanda"
                                onclick="removeDomanda(${domanda.id})">&times;</span>
                        </li>
                    </c:forEach>
                </ul>
                <button type="button" class="manage-questions-btn"
                    onclick="goToListaDomande()" title="Aggiungi Domande">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
            <div class="create-div">
                <a class="back-button" href="/wisteria/home"> <i
			        class="fas fa-arrow-left"></i>
		        </a>
                <button class="create-btn" type="submit">Crea</button>
            </div>

        </form>
    </div>

    <script>
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
            const titolo = encodeURIComponent(document.getElementById('titolo-input').value);
            const descrizione = encodeURIComponent(document.getElementById('descrizione-input').value);

            const provinciaSelect = document.getElementById('provincia-input');
            const provincia = provinciaSelect.value;

            const settore = encodeURIComponent(document.getElementById('settore-input').value);

            const params = new URLSearchParams(window.location.search);
            const questions = params.getAll('question');

            const baseUrl = '${pageContext.request.contextPath}/listadomande';
            const urlWithParams = baseUrl + '?titolo=' + titolo + '&descrizione=' + descrizione + '&provincia=' + encodeURIComponent(provincia) + '&settore=' + settore + '&' + questions.map(q => 'question=' + encodeURIComponent(q)).join('&');

            location.href = urlWithParams;
        }

        document.addEventListener('DOMContentLoaded', () => {

            const params = new URLSearchParams(window.location.search);
            const settore = params.get("settore");
            if (settore) {
                document.getElementById('settore-input').value = settore;
            }

            const provinciaSelect = document.getElementById('provincia-input');
            const regioneSelect = document.getElementById('regione-input');

            provinciaSelect.addEventListener('change', () => {
                const provincia = provinciaSelect.value.trim();
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
                provinciaSelect.value = provincia;
                const regioneSelect = document.getElementById('regione-input');
                regioneSelect.value = provinciaToRegioneMap[provincia];
            }
        }
        window.addEventListener('popstate', setProvincia);
        window.addEventListener('load', setProvincia);

        function removeDomanda(domandaId) {
            var params = new URLSearchParams(window.location.search);
            var titolo = params.get("titolo");
            var descrizione = params.get("descrizione");
            var provincia = params.get("provincia");
            var settore = params.get("settore");

            if (!titolo) {
                titolo = encodeURIComponent(document.getElementById('titolo-input').value);
            }

            if (!descrizione) {
                descrizione = encodeURIComponent(document.getElementById('descrizione-input').value);
            }

            if (!provincia) {
                const provinciaSelect = document.getElementById('provincia-input');
                provincia = provinciaSelect.value;
            }

            if (!settore) {
                settore = encodeURIComponent(document.getElementById('settore-input').value);
            }

            var domande = params.getAll("question");

            var baseUrl = '${pageContext.request.contextPath}/creaposizione';
            var urlWithParams = baseUrl + '?titolo=' + titolo + '&descrizione=' + descrizione + '&provincia=' + provincia + '&settore=' + settore + '&' + domande.filter(q => q.toString() !== domandaId.toString()).map(q => 'question=' + q).join('&');
            console.log(urlWithParams);

            location.href = urlWithParams;
        }

        function showAlert(message, type = "error") {
            const alertBox = document.getElementById("alert-box");
            alertBox.textContent = message;

            // Aggiunge una classe per il tipo di messaggio
            if (type === "success") {
                alertBox.classList.add("success");
                alertBox.classList.remove("error");
            } else {
                alertBox.classList.add("error");
                alertBox.classList.remove("success");
            }

            // Mostra l'alert con animazione
            alertBox.classList.add("show");

            // Nasconde l'alert dopo 2 secondi
            setTimeout(() => {
                alertBox.classList.remove("show");
            }, 2000);
        }

        function validate(event) {
            const domandaList = document.getElementById("selected-questions-list");
            const items = domandaList.querySelectorAll("li");

            if (items.length == 0) {
                showAlert("Devi selezionare almeno una domanda.");
                event.preventDefault();
                return false;
            }
            return true;
        }

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
