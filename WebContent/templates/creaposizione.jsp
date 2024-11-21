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
        <h1 class="form-title">Aggiungi posizione</h1>

            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Titolo:</label> <input name="titolo" type="text"
                        class="form-input" id="titolo-input"
                        placeholder="Inserisci il titolo della posizione">
                </div>

                <div class="form-group">
                    <label class="form-label">Descrizione:</label> <textarea name="descrizione" type="text"
                        class="form-input" placeholder="Inserisci la descrizione"  id="descrizione-input"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Località:</label>
                <div class="location-group">
                    <select  id="regione-input" name="regione" class="form-select">
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region}">${region}</option>
                        </c:forEach>
                    </select> <select  id="provincia-input" name="provincia" class="form-select">
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
			<div class="container">
				<label for="textAreaWithOptions">Scrivi o seleziona un'opzione:</label>
				<textarea  id="settore-input" rows="4" placeholder="Scrivi qui..."></textarea>
				<select id="dropdownOptions">
					<option value="">-- Seleziona un'opzione --</option>
					<option value="Opzione 1">Opzione 1</option>
					<option value="Opzione 2">Opzione 2</option>
					<option value="Opzione 3">Opzione 3</option>
				</select>
			</div>
            <div class="questions-section">
                <h3 class="questions-title">Domande selezionate</h3>
                <ul class="selected-questions">
                    <li>Quale KPI è fondamentale per un Sales Manager?</li>
                    <li>Come gestisci un team di vendita?</li>
                    <li>Descrivi una tua esperienza di successo nella vendita.</li>
                </ul>
                <button type="button" class="manage-questions-btn questions-btn-2" onclick="location.href='${pageContext.request.contextPath}/templates/cercaDomande.jsp'">
                    Gestisci domande
                </button>
            </div>

            <!-- Aggiungi qui eventuali altri campi del form -->

            <button onclick="inviaPosizione()"class="create-btn">Crea Posizione</button>
        </form>
        <a class="back-button" href="javascript:history.back();"> 
        <i class="fas fa-arrow-left"></i>
		</a>
    </div>

</body>

<script>


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
            // FARE REINDIRIZZAMENTO IN BACK-END?
            window.location.href = '${pageContext.request.contextPath}/home';
        })
        .catch(error => {
            console.error('Errore:', error);
            alert("Si è verificato un errore durante la creazione della posizione.");
        });
    }


</script>

</html>
