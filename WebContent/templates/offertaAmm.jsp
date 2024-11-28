<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_offertaAmm.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_nav.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>
<body>
    <div class="content-container contenuto">
        <div id="custom-alert" class="alert-box">
		    <span id="alert-message">Sei sicuro di voler eliminare questa posizione lavorativa?</span><br>
		    <button class="btn btn-danger" onclick="confirmAction(true)">Conferma</button>
		    <button class="btn btn-secondary" onclick="confirmAction(false)">Annulla</button>
		</div>

        <div class="card">
            <div class="scroll-wrapper-classifica">
				<div class="job-header" style="margin-top: 5px">
				    <h1 class="job-title">${posizione.titolo}</h1>
				    <div class="btn-group">
						<button class="btn-del" onclick="handleDelete(${posizione.id})" title="Cancella">
						    <i class="far fa-trash-alt" style="font-size: 1.5rem;"></i>
						</button>
				    </div>
				</div>
                <div class="job-meta">
                    <div class="dettagli-offerta">
                        <p class="p-posizione">
                        <i class="fas fa-map-marker-alt"></i>
                        ${posizione.provincia} - ${posizione.regione}
                        </p>
                    </div>
                    <div class="dettagli-offerta">
                        <p class="p-settore">
                        <i class="fas fa-briefcase">
                        </i> ${posizione.settore}</p>
                    </div>
                </div>
                <h2 class="section-title"></h2>
                <div class="job-description">
                    ${posizione.descrizione}
                </div>
            </div>
        </div>
        <div class="card">
            <div class="scroll-wrapper-classifica">
                <h2 class="ranking-title">Classifica</h2>

                <div class="podium-container">
                    <c:forEach var="candidate" items="${candidates}" varStatus="loopStatus">
                        <c:if test="${loopStatus.index < 3}">
                            <div class="podium-item podium-position-${loopStatus.index + 1}" onclick="window.location.href='${pageContext.request.contextPath}/visualizzacandidato?id=${candidate.utente}&idPosizione=${posizione.id}'"
                                style="cursor: pointer">
                                <span class="podium-rank">${loopStatus.index + 1}°</span>
                                <span class="podium-name">${candidate.utente}</span>
                                <span class="podium-score">${candidate.punteggio}/10</span>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="ranking-list">
                    <c:forEach var="candidate" items="${candidates}" varStatus="loopStatus">
                        <c:if test="${loopStatus.index >= 3}">
                            <div class="ranking-item"
                                onclick="window.location.href='${pageContext.request.contextPath}/visualizzacandidato?id=${candidate.utente}'"
                                style="cursor: pointer">
                                <div class="candidate-info">
                                    <span class="rank-number">${loopStatus.index + 1}°</span>
                                    <span class="medal-icon">
                                        <c:if test="${loopStatus.index + 1 == 1}">
                                            <i class="fa-solid fa-trophy"></i>
                                        </c:if>
                                    </span>
                                    <span class="candidate-name">${candidate.utente}</span>
                                </div>
                                <span class="candidate-score">${candidate.punteggio}/10</span>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="btn-container">
        <a class="btn btn-back" href="javascript:history.back();">
        	Torna alla Home
        </a>
    </div>

    <script>
    let actionType = null; // 'delete' o 'closure'
    let actionId = null;

    // Funzione per gestire l'eliminazione
    function handleDelete(id) {
        actionType = 'delete';
        actionId = id;
        document.getElementById('alert-message').innerText = 'Sei sicuro di voler eliminare questa posizione lavorativa?';
        showAlert();
    }


    // Funzione per mostrare la finestra di dialogo
    function showAlert() {
        const alertBox = document.getElementById('custom-alert');
        alertBox.classList.add('show');
    }

    // Funzione per nascondere la finestra di dialogo
    function hideAlert() {
        const alertBox = document.getElementById('custom-alert');
        alertBox.classList.remove('show');
    }

    // Funzione per confermare l'azione
    function confirmAction(confirm) {
        if (confirm) {
            if (actionType === 'delete') {
                // Logica per l'eliminazione
                const formData = new URLSearchParams();
                formData.append('posizioneID', actionId);
                
                fetch('/wisteria/offerta', {
                    method: 'DELETE',
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
                .catch(error => {
                    console.error("Errore:", error);
                    alert('Si è verificato un errore. Riprova più tardi.');
                });
            } else if (actionType === 'closure') {
                // Logica per la chiusura
                const formData = new URLSearchParams();
                formData.append('posizioneID', actionId);
                
                fetch('/wisteria/offerta/closure', { // Assicurati che questo sia l'endpoint corretto per la chiusura
                    method: 'POST', // Usa il metodo appropriato (POST, PUT, ecc.)
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
                .catch(error => {
                    console.error("Errore:", error);
                    alert('Si è verificato un errore. Riprova più tardi.');
                });
            }
        }
        hideAlert();
    }

    </script>
</body>
</html>
