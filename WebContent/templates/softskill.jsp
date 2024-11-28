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
	<div class="container-quiz">
		<h1 class="title">Quiz soft skill</h1>
		<div class="accordion">
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h2 class="accordion-title"><b>Quale di queste opzioni descrive meglio una comunicazione efficace?</h2>
                    <i class="fas fa-chevron-down accordion-icon"></i>
                </div>
                <div class="accordion-content">
                    <ul class="answer-list">
                        <button class="answer-item" data-domanda-id="uno" data-risposta="1" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>a)</b> Parlare senza pause per mostrare sicurezza.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="uno" data-risposta="2" onclick="selectAnswer(this)"> <!--CORRETTA -->
                            <p class="answer-text"><b>b)</b> Ascoltare attivamente e adattare il messaggio al pubblico.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="uno" data-risposta="3" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>c)</b> Utilizzare un linguaggio tecnico per sembrare più esperti.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="uno" data-risposta="4" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>d)</b> Condividere solo informazioni personali.</p>
                        </button>
                    </ul>
                </div>
            </div>

            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h2 class="accordion-title"><b>Un collega presenta un'idea che non condividi. Come rispondi?</b></h2>
                    <i class="fas fa-chevron-down accordion-icon"></i>
                </div>
                <div class="accordion-content">
                    <ul class="answer-list">
                        <button class="answer-item" data-domanda-id="due" data-risposta="1" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>a)</b> Ignori l'idea e proponi la tua.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="due" data-risposta="2" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>b)</b> Critichi apertamente il collega davanti a tutti.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="due" data-risposta="3" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>c)</b> Proponi un confronto costruttivo per discutere le differenze.</p>  <!--CORRETTA -->
                        </button>
                        <button class="answer-item" data-domanda-id="due" data-risposta="4" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>d)</b> Rimani in silenzio per evitare conflitti.</p>
                        </button>
                    </ul>
                </div>
            </div>

            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h2 class="accordion-title"><b>Se hai molte scadenze contemporaneamente, cosa fai per gestirle?</b></h2>
                    <i class="fas fa-chevron-down accordion-icon"></i>
                </div>
                <div class="accordion-content">
                    <ul class="answer-list">
                        <button class="answer-item" data-domanda-id="tre" data-risposta="1" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>a)</b> Lavori su tutte nello stesso momento senza priorità.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="tre" data-risposta="2" onclick="selectAnswer(this)"> 
                            <p class="answer-text"><b>b)</b> Delego tutto ai colleghi.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="tre" data-risposta="3" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>c)</b> Stabilisci priorità e pianifichi il tempo per ogni attività.</p> <!--CORRETTA -->
                        </button>
                        <button class="answer-item" data-domanda-id="tre" data-risposta="4" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>d)</b> Rimandi tutto all'ultimo momento.</p>
                        </button>
                    </ul>
                </div>
            </div>

            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h2 class="accordion-title"><b>Qual è il primo passo per risolvere un problema complesso?</b></h2>
                    <i class="fas fa-chevron-down accordion-icon"></i>
                </div>
                <div class="accordion-content">
                    <ul class="answer-list">
                        <button class="answer-item" data-domanda-id="quattro" data-risposta="1" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>a)</b> Agire immediatamente, senza analizzare la situazione.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="quattro" data-risposta="2" onclick="selectAnswer(this)"> <!--CORRETTA -->
                            <p class="answer-text"><b>b)</b> Identificare chiaramente il problema.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="quattro" data-risposta="3" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>c)</b> Chiedere a qualcun altro di risolverlo.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="quattro" data-risposta="4" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>d)</b> Concentrarsi sulle difficoltà personali legate al problema.</p>
                        </button>
                    </ul>
                </div>
            </div>

            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h2 class="accordion-title">Un collega sembra stressato sul lavoro. Come ti comporti?</b></h2>
                    <i class="fas fa-chevron-down accordion-icon"></i>
                </div>
                <div class="accordion-content">
                    <ul class="answer-list">
                        <button class="answer-item" data-domanda-id="cinque" data-risposta="1" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>a)</b> Gli fai sapere che sei disponibile per ascoltarlo.</p><!--CORRETTA -->
                        </button>
                        <button class="answer-item" data-domanda-id="cinque" data-risposta="2" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>b)</b> Lo ignori per non interferire.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="cinque" data-risposta="3" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>c)</b> Gli suggerisci di lavorare di più per superare lo stress.</p>
                        </button>
                        <button class="answer-item" data-domanda-id="cinque" data-risposta="4" onclick="selectAnswer(this)">
                            <p class="answer-text"><b>d)</b> Eviti il problema finché non lo risolve da solo.</p>
                        </button>
                    </ul>
                </div>
            </div>
		</div>
		<div class="submit-container">
			<button type="button" class="submit-button" onclick="submitAnswers()">Invia</button>
		</div>
        <div class="btn-container">
            <button class="btn btn-back" onclick="javascript:history.back();">
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
	        const rispostaId = button.getAttribute("data-risposta"); 
	        
	        formData.append(domandaId, rispostaId);
	    });

	    console.log(formData.toString());

	    fetch('/wisteria/softskill', {
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
            const rispostaId = button.getAttribute("data-risposta");
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
</body>
</html>