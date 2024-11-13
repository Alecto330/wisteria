<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font-Awesome per le icone (senz doverle scaricare) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_testcandidato.css">
    <title>Quiz App</title>
</head>
<body>
	
	<div class="container-quiz">
        <h1 class="title">Quiz per #INSERIRE POSIZIONE#</h1>
        
        <div class="accordion">
            
            <%-- Domande di esempio per testing --%>
            <c:if test="${empty questions}">
                <div class="accordion-item">
                    <div class="accordion-header" onclick="toggleAccordion(this)">
                        <h2 class="accordion-title">Domanda</h2>
                        <i class="fas fa-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <ul class="answer-list">
                            <button class="answer-item">
                                <p class="answer-text">Risposta</p>
                            </button>
                            <button class="answer-item">
                                <p class="answer-text">Risposta</p>
                            </button>
                            <button class="answer-item">
                                <p class="answer-text">Risposta</p>
                            </button>
                            <button class="answer-item">
                                <p class="answer-text">Risposta</p>
                            </button>
                        </ul>
                    </div>
                </div>

            </c:if>
        </div>

    <div class="submit-container">
        <button type="button" class="submit-button">Invia</button>
    </div>

    </div>

    <script>
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




        document.querySelectorAll('.answer-item').forEach(item => {
            item.addEventListener('click', function() {
                // Rimuove la classe "selected" da tutti gli elementi
                document.querySelectorAll('.answer-item').forEach(el => el.classList.remove('selected'));
                // Aggiunge la classe "selected" solo all'elemento cliccato
                this.classList.add('selected');
            });
        });

    </script>

</body>
</html>