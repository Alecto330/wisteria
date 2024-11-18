<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_testcandidato.css">
</head>
<body>

	<div class="container-quiz">
		<h1 class="title">Quiz per ${nomePosizione}</h1>

		<div class="accordion">
			<!-- Loop over the list of Domanda objects -->
			<c:forEach var="domanda" items="${domande}">
                <div class="accordion-item">
                    <div class="accordion-header" onclick="toggleAccordion(this)">
                        <h2 class="accordion-title">${domanda.domanda}</h2>
                        <i class="fas fa-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <ul class="answer-list">
                            <c:forEach var="risposta" items="${domanda.risposte}">
                                <button 
                                    class="answer-item" 
                                    data-domanda-id="${domanda.id}" 
                                    data-risposta-id="${risposta.id}" 
                                    onclick="selectAnswer(this)">
                                    <p class="answer-text">${risposta.risposta}</p>
                                </button>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
		</div>

		<div class="submit-container">
			<button type="button" class="submit-button" onclick="submitAnswers()">Invia</button>
		</div>

	</div>

	<script>


	function submitAnswers() {
	    const formData = new URLSearchParams();
	    // Collect selected answers
	    const selectedButtons = document.querySelectorAll('.answer-item.selected');

	    selectedButtons.forEach(button => {
	        const domandaId = button.getAttribute("data-domanda-id"); 
	        const rispostaId = button.getAttribute("data-risposta-id"); 
	        
	        formData.append(domandaId, rispostaId);
	    });

	    console.log(formData);

	    // Send the formData using fetch
	    fetch('/wisteria/test', {
	        method: 'POST', 
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        body: formData.toString() // Serialize the formData
	    })
	    .then(response => response.text())
	    .then(data => {
	        console.log('Risposte inviate con successo:', data);
	    })
	    .catch(error => {
	        console.error('Errore nell\'invio delle risposte:', error);
	    });
	}



    // ############################  ACCORDION ##############################
        function toggleAccordion(header) {
            // Trova tutti gli accordion
            const allContents = document.querySelectorAll('.accordion-content');
            const allIcons = document.querySelectorAll('.accordion-icon');
            
            // Trova il content e l'icona associati all'header cliccato
            const content = header.nextElementSibling;
            const icon = header.querySelector('.accordion-icon');
            
            // Se il content è già aperto, chiudilo
            if (content.style.height && content.style.height !== '0px') {
                content.style.height = '0px';
                icon.style.transform = 'rotate(0deg)';
            } else {
                // Altrimenti, apri l'accordion
                content.style.height = content.scrollHeight + 'px';
                icon.style.transform = 'rotate(180deg)';
            }
        }

        // Inizializza tutti gli accordion come aperti di default
        document.addEventListener('DOMContentLoaded', function() {
            const allContents = document.querySelectorAll('.accordion-content');
            const allIcons = document.querySelectorAll('.accordion-icon');
            
            // Imposta tutti gli accordion come aperti
            allContents.forEach(content => {
                content.style.height = content.scrollHeight + 'px';
            });
            
            // Ruota tutte le icone degli accordion per indicare che sono aperti
            allIcons.forEach(icon => {
                icon.style.transform = 'rotate(180deg)';
            });
        });



        // #################### RISPOSTE #########################

         function selectAnswer(button) {
            // Ottieni l'ID della risposta selezionata
            const rispostaId = button.getAttribute("data-risposta-id");
            const domandaId = button.getAttribute("data-domanda-id");

            console.log("ID della domanda selezionata:", domandaId);
            console.log("ID della risposta selezionata:", rispostaId);

            // Trova tutti i pulsanti di risposta
            const buttons = document.querySelectorAll('.answer-item');

            // Filtra solo i pulsanti per la domanda corrente
            const buttonsForDomanda = Array.from(buttons).filter(btn => btn.getAttribute("data-domanda-id") === domandaId.toString());
            console.log("Pulsanti trovati per la domanda:", buttonsForDomanda);

            // Rimuovi la classe "selected" da tutti i pulsanti per quella domanda
            buttonsForDomanda.forEach(btn => {
                btn.classList.remove("selected");
            });

            // Aggiungi la classe "selected" al pulsante cliccato
            button.classList.add("selected");

            // Stampa l'ID della risposta selezionata per debug
            console.log("Risposta selezionata ID:", rispostaId);
        }


        // ##################### SUBMIT #########################

        



    </script>

</body>
</html>