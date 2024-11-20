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
    
    <style>
        /* Stili esistenti */
        @import
            url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');

        body {
            height: 100%; /* Occupa tutta l'altezza disponibile */
            width: 100%;
            align-items: center; /* Centra verticalmente */
            justify-content: center; /* Centra orizzontalmente */
            background-image: linear-gradient(130deg, rgba(255, 255, 255, 0.8), rgba(230, 230, 230, 0.8), rgba(165, 48, 255, 0.8)), url("../assets/bg-blurrato.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .main-container-creaposizione {
            max-width: 65%; /* Limits the container width */
            margin: 150px auto; /* Centers it horizontally and adds top margin */
            padding: 2.5rem;
            background-color: #e0c0ff;
            border-radius: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 90%; /* Sets the width to 90% of the parent up to max-width */
        }

        .form-title {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 2rem;
            text-align: center;
            font-weight: 600;
        }

        /* Rimozione della griglia per i campi Titolo e Descrizione */
        /* .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        } */

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: inline-block;
            color: #333;
            margin-bottom: 0.5rem;
            font-size: 1rem;
            border-bottom: 2px solid #6e41e2;
            padding-bottom: 2px;
        }

        .form-input, .form-select, textarea {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid transparent;
            border-radius: 10px;
            font-size: 0.95rem;
            background: white;
            transition: all 0.3s ease;
            color: #333;
        }

        .form-input:focus, .form-select:focus, textarea:focus {
            outline: none;
            border-color: #6e41e2;
            box-shadow: 0 0 0 3px rgba(110, 65, 226, 0.1);
        }

        .form-input::placeholder, textarea::placeholder {
            color: #aaa;
        }

        .location-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .questions-section {
            background-color: rgba(110, 65, 226, 0.1);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .questions-title {
            font-size: 1.2rem;
            color: #6e41e2;
            margin-bottom: 1rem;
        }

        .selected-questions {
            list-style-type: disc;
            padding-left: 20px;
            margin-bottom: 1rem;
        }

        .selected-questions li {
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
            color: #333;
        }

        .manage-questions-btn {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
            padding: 0.8rem;
            background-color: #6e41e2;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .manage-questions-btn:hover {
            background-color: #5a35c8;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(110, 65, 226, 0.2);
        }

        .create-btn {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
            padding: 1rem;
            background-color: #6e41e2;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .create-btn:hover {
            background-color: #5a35c8;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(110, 65, 226, 0.2);
        }

        /* Stili per il dropdown Settore migliorato */
        .dropdown {
            position: relative;
            width: 100%;
        }

        .dropdown-toggle {
            border-radius: 10px;
            padding-right: 2.5rem; /* Spazio per l'icona */
            position: relative;
        }

        .dropdown-toggle::after {
            content: '\f0d7'; /* Icona freccia giù di Font Awesome */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
            color: #6e41e2;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            max-height: 200px;
            overflow-y: auto;
            z-index: 1000;
            display: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .dropdown-menu li {
            padding: 10px 15px;
            cursor: pointer;
        }

        .dropdown-menu li:hover,
        .dropdown-menu li.active {
            background-color: #f0f0f0;
        }

        /* Stili per campo Regione disabilitato */
        .form-select:disabled {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
    </style>
    
</head>

<body>

    <div class="main-container-creaposizione">
        <h1 class="form-title">Aggiungi posizione</h1>
        <form action="${pageContext.request.contextPath}/inviaPosizione" method="post">
            <!-- Campo Titolo su una riga separata -->
            <div class="form-group">
                <label class="form-label" for="titolo-input">Titolo:</label>
                <input name="titolo" type="text"
                    class="form-input" id="titolo-input"
                    placeholder="Inserisci il titolo della posizione" required>
            </div>

            <!-- Campo Descrizione sotto il Titolo come textarea -->
            <div class="form-group">
                <label class="form-label" for="descrizione-input">Descrizione:</label>
                <textarea name="descrizione" 
                    class="form-input" 
                    placeholder="Inserisci la descrizione"  
                    id="descrizione-input" 
                    rows="4" 
                    required></textarea>
            </div>

            <div class="form-group">
                <label class="form-label" for="localita-input">Località:</label>
                <div class="location-group">
                    <select  id="regione-input" name="regione" class="form-select" required>
                        <option value="">-- Seleziona Regione --</option>
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region}">${region}</option>
                        </c:forEach>
                    </select> 
                    <select  id="provincia-input" name="provincia" class="form-select" required>
                        <option value="">-- Seleziona Provincia --</option>
                        <c:forEach var="province" items="${provinceList}">
                            <option value="${province}">${province}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <!--  
            <div class="form-group">
                <label class="form-label">Settore:</label> <select name="professione"
                    class="form-select">
                    <c:forEach var="profession" items="${professionList}">
                        <option value="${profession}">${profession}</option>
                    </c:forEach>
                </select>
            </div>
            -->

            <!-- Sezione Settore Migliorata -->
            <div class="form-group">
                <label class="form-label" for="settore-input">Settore:</label>
                <div class="dropdown" id="settore-dropdown">
                    <input 
                        id="settore-input" 
                        type="text" 
                        class="form-input dropdown-toggle" 
                        placeholder="Seleziona o digita un settore" 
                        aria-haspopup="listbox" 
                        aria-expanded="false" 
                        autocomplete="off"
                        required
                    >
                    <ul class="dropdown-menu" role="listbox" aria-labelledby="settore-input">
                        <c:forEach var="settore" items="${settoreList}">
                            <li role="option" tabindex="0">${settore}</li>
                        </c:forEach>
                        <!-- Esempi di opzioni statiche, da rimuovere se usi dinamiche -->
                        
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
                    <li>Quale KPI è fondamentale per un Sales Manager?</li>
                    <li>Come gestisci un team di vendita?</li>
                    <li>Descrivi una tua esperienza di successo nella vendita.</li>
                </ul>
                <button type="button" class="manage-questions-btn" onclick="location.href='${pageContext.request.contextPath}/templates/cercaDomande.jsp'">
                    Gestisci domande
                </button>
            </div>

            <!-- Aggiungi qui eventuali altri campi del form -->

            <button type="submit" class="create-btn">Crea Posizione</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Gestione del dropdown Settore
            const dropdown = document.getElementById('settore-dropdown');
            const input = dropdown.querySelector('#settore-input');
            const list = dropdown.querySelector('.dropdown-menu');
            const items = Array.from(list.querySelectorAll('li'));
            let currentFocus = -1;

            // Mostra il dropdown quando l'input è focalizzato
            input.addEventListener('focus', () => {
                list.style.display = 'block';
                input.setAttribute('aria-expanded', 'true');
            });

            // Nasconde il dropdown quando si clicca fuori
            document.addEventListener('click', (e) => {
                if (!dropdown.contains(e.target)) {
                    list.style.display = 'none';
                    input.setAttribute('aria-expanded', 'false');
                    currentFocus = -1;
                    removeActive();
                }
            });

            // Filtra le opzioni mentre l'utente digita
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

            // Popola l'input quando si clicca su un'opzione
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

            // Navigazione tramite tastiera
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

            // Nuovo codice per gestire Regione e Provincia
            const regioneSelect = document.getElementById('regione-input');
            const provinciaSelect = document.getElementById('provincia-input');

            function toggleRegioneSelect() {
                if (provinciaSelect.value) {
                    regioneSelect.disabled = true;
                    // Rimuove la selezione della Regione se è stata disabilitata
                    regioneSelect.value = "";
                } else {
                    regioneSelect.disabled = false;
                }
            }

            // Inizializza lo stato del campo Regione al caricamento della pagina
            toggleRegioneSelect();

            // Aggiunge l'evento di cambio al campo Provincia
            provinciaSelect.addEventListener('change', toggleRegioneSelect);

            // Opzionale: Se desideri che la selezione della Regione influisca sulla Provincia
            // puoi aggiungere un listener anche al campo Regione
            /*
            regioneSelect.addEventListener('change', () => {
                if (regioneSelect.value) {
                    provinciaSelect.disabled = false;
                }
            });
            */
        });
    </script>
</body>
</html>
