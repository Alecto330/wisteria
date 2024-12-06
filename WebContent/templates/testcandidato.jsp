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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
	<div id="custom-alert" class="alert-box">
				<span id="alert-message">Sei sicuro di abbandonare il quiz?</span><br>
				<button class="btn btn-danger" onclick="confirmAction(true)">Conferma</button>
				<button class="btn btn-secondary" onclick="confirmAction(false)">Annulla</button>
			</div>
	<div class="container-quiz animate-on-scroll loader">
		<h1 class="title">Quiz per ${nomePosizione}</h1>
		<div class="accordion">
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
        <div class="btn-container">
            <button class="btn btn-back" onclick="giangiovanni()">
                ← Torna Indietro
            </button>
        </div>
	</div>
	<script>
        // ##################### SUBMIT #########################

	function submitAnswers() {
	    const formData = new URLSearchParams();
	    const selectedButtons = document.querySelectorAll('.answer-item.selected');
	     const totalQuestions = document.querySelectorAll('.accordion-item').length;
	    
        if (selectedButtons.length < totalQuestions) {
            alert("Per favore, rispondi a tutte le domande prima di inviare.");
            return; // Blocca l'invio
        }
	    const params = new URLSearchParams(window.location.search);
	    const idPosizione=params.get('idPosizione');
	    
	    selectedButtons.forEach(button => {
	        const domandaId = button.getAttribute("data-domanda-id"); 
	        const rispostaId = button.getAttribute("data-risposta-id"); 
	        
	        formData.append(domandaId, rispostaId);
	    });
	    
        formData.append('idPosizione', idPosizione);

	    console.log(formData.toString());

	    fetch('/wisteria/test', {
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
	        console.log('Risposte inviate con successo:', data);
	    })
	    .catch(error => {
	        console.error('Errore nell\'invio delle risposte:', error);
	    });
	}

    // ############################  ACCORDION ##############################
        function toggleAccordion(header) {
            const allContents = document.querySelectorAll('.accordion-content');
            const allIcons = document.querySelectorAll('.accordion-icon');
            const content = header.nextElementSibling;
            const icon = header.querySelector('.accordion-icon');
            if (content.style.height && content.style.height !== '0px') {
                content.style.height = '0px';
                icon.style.transform = 'rotate(0deg)';
            } else {
                content.style.height = content.scrollHeight + 'px';
                icon.style.transform = 'rotate(180deg)';
            }
        }
        document.addEventListener('DOMContentLoaded', function() {
            const allContents = document.querySelectorAll('.accordion-content');
            const allIcons = document.querySelectorAll('.accordion-icon');
            allContents.forEach(content => {
                content.style.height = content.scrollHeight + 'px';
            });
            allIcons.forEach(icon => {
                icon.style.transform = 'rotate(180deg)';
            });
        });



        // #################### RISPOSTE #########################

         function selectAnswer(button) {
            const rispostaId = button.getAttribute("data-risposta-id");
            const domandaId = button.getAttribute("data-domanda-id");

            console.log("ID della domanda selezionata:", domandaId);
            console.log("ID della risposta selezionata:", rispostaId);
            
            const buttons = document.querySelectorAll('.answer-item');
            const buttonsForDomanda = Array.from(buttons).filter(btn => btn.getAttribute("data-domanda-id") === domandaId.toString());
            console.log("Pulsanti trovati per la domanda:", buttonsForDomanda);
            buttonsForDomanda.forEach(btn => {
                btn.classList.remove("selected");
            });
            button.classList.add("selected");
            console.log("Risposta selezionata ID:", rispostaId);
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

	

	function giangiovanni(){
		console.log("GIANGIOVANNI");
		document.getElementById('alert-message').innerText = 'Sei sicuro di voler abbandonare il quiz?\nLe risposte selezionate non verranno salvate!';
        showAlert();
	}

	function showAlert() {
		console.log("SHOWALERT");
        const alertBox = document.getElementById('custom-alert');
		console.log(alertBox);
        alertBox.classList.add('show');
    }

    function hideAlert() {
        const alertBox = document.getElementById('custom-alert');
        alertBox.classList.remove('show');
    }

    function confirmAction(confirm) {
		const params = new URLSearchParams(window.location.search);
		const id = params.get('idPosizione');
        if (confirm) {
            window.location.href="${pageContext.request.contextPath}/offerta?id=" + id;
        }
        hideAlert();
    }
	</script>




</body>
</html>