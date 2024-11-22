<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font-Awesome per le icone -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_creadomanda.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
    <style>
        /* Stile per il div dell'alert */
        .alert-box {
            display: none;
            position: fixed;
            top: 10%;
            left: 50%;
            transform: translateX(-50%) translateY(-100%);
            background-color: #f44336;
            color: #fff;
            padding: 20px 25px;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            z-index: 1000;
            opacity: 0;
            transition: all 0.5s ease-in-out;
            text-align: center;
        }

        .alert-box.success {
            background-color: #4caf50;
        }

        .alert-box.show {
            display: block;
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
    </style>
</head>
<body>
	<div class="main-container-creadomanda">
        <h1 class="form-title">Aggiungi Domanda</h1>

        <form id="question-form">
            <label class="question-label">Testo della domanda :</label>
            <input type="text" class="question-input" id="question-input" placeholder="Inserisci la domanda">

            <div class="answers-container">
                <div class="answer-group">
                    <label class="radio-container">
                        <input type="radio" name="answer" class="radio-input" checked>
                        <span class="radio-mark"></span>
                    </label>
                    <input type="text" class="answer-input" placeholder="Inserisci la risposta">
                </div>

                <div class="answer-group">
                    <label class="radio-container">
                        <input type="radio" name="answer" class="radio-input">
                        <span class="radio-mark"></span>
                    </label>
                    <input type="text" class="answer-input" placeholder="Inserisci la risposta">
                </div>

                <div class="answer-group">
                    <label class="radio-container">
                        <input type="radio" name="answer" class="radio-input">
                        <span class="radio-mark"></span>
                    </label>
                    <input type="text" class="answer-input" placeholder="Inserisci la risposta">
                </div>

                <div class="answer-group">
                    <label class="radio-container">
                        <input type="radio" name="answer" class="radio-input">
                        <span class="radio-mark"></span>
                    </label>
                    <input type="text" class="answer-input" placeholder="Inserisci la risposta">
                </div>
            </div>

            <button type="button" class="create-btn" onclick="validateForm()" title="Aggiungi Domande">
                Crea
            </button>

            <a class="back-button" href="javascript:history.back();"> 
                <i class="fas fa-arrow-left"></i>
            </a>
        </form>
    </div>

    <!-- Div per i messaggi di alert -->
    <div id="alert-box" class="alert-box"></div>

    <script>
        function showAlert(message, type = 'error') {
            const alertBox = document.getElementById('alert-box');
            alertBox.textContent = message;

            // Aggiunge una classe per il tipo di messaggio
            if (type === 'success') {
                alertBox.classList.add('success');
            } else {
                alertBox.classList.remove('success');
            }

            // Mostra l'alert con animazione
            alertBox.classList.add('show');

            // Nasconde l'alert dopo 3 secondi
            setTimeout(() => {
                alertBox.classList.remove('show');
            }, 2000);
        }

        function validateForm() {
            const questionInput = document.getElementById('question-input');
            const answerInputs = document.querySelectorAll('.answer-input');
            const radioButtons = document.querySelectorAll('.radio-input');

            let isValid = true;

            // Controllo se il campo della domanda è vuoto
            if (questionInput.value.trim() === '') {
                showAlert('Attenzione: il campo della domanda non può essere vuoto.');
                questionInput.focus();
                isValid = false;
                return;
            }

            let selectedAnswer = null;
                radioButtons.forEach((radio, index) => {
                    if (radio.checked) {
                        selectedAnswer = index;  // Puoi passare l'indice del radio selezionato
                    }
               });

            // Controllo che tutte le risposte siano presenti
            for (let input of answerInputs) {
                if (input.value.trim() === '') {
                    showAlert('Attenzione: tutte le risposte devono essere compilate.');
                    input.focus();
                    isValid = false;
                    return;
                }
            }

            // Se il form è valido
            if (isValid) {
	
            	   // Estrai il testo della domanda e le risposte
                const questionText = questionInput.value.trim();
                const answers = Array.from(answerInputs).map(input => input.value.trim());

                const formData = new URLSearchParams({
                    question: questionText,
                    answers: answers,
                    selectedAnswer: selectedAnswer 
                });

                console.log(formData.toString())
                
                // Invia i dati tramite POST
                fetch('${pageContext.request.contextPath}/creadomanda', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData.toString(),
                })
                .then(response => {
                	
                })
                .then(data => {
                    // Aggiungi qui la logica in caso di successo del POST
                    console.log('Domanda aggiunta con successo:', data);
                    //location.href = '${pageContext.request.contextPath}/listadomande';
                })
                .catch(error => {
                    // Aggiungi qui la logica in caso di errore
                    console.error('Errore durante l\'invio della domanda:', error);
                    showAlert('Errore durante l\'invio della domanda.');
                });
            	
            }
            
            
            
            
        }

        // Seleziona automaticamente il radio button quando si clicca su un campo di input risposta
       document.querySelectorAll('.answer-input').forEach(input => {
            input.removeEventListener('focus', () => {
                const radioInput = input.previousElementSibling.querySelector('input[type="radio"]');
                radioInput.checked = true;
            });

            input.removeEventListener('click', () => {
                const radioInput = input.previousElementSibling.querySelector('input[type="radio"]');
                radioInput.checked = true;
            });
        });
    </script>

</body>
</html>
