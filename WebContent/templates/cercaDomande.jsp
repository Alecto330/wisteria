<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista Domande</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    	<link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_cercaDomande.css">
</head>
<body>
    <div class="container">
        <h1 class="title">Lista Domande</h1>
        
        <div class="accordion">
            <c:forEach var="question" items="${questions}" varStatus="status">
                <div class="accordion-item">
                    <div class="accordion-header" onclick="toggleAccordion(this)">
                        <h2 class="accordion-title">${question.testo}</h2>
                        <i class="fas fa-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <ul class="answer-list">
                            <c:forEach var="answer" items="${question.risposte}">
                                <li class="answer-item ${answer.corretta ? 'correct' : ''}">
                                    <c:if test="${answer.corretta}">
                                        <i class="fas fa-check-circle answer-icon"></i>
                                    </c:if>
                                    <p class="answer-text">${answer.testo}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
            
            <%-- Domande di esempio per testing --%>
            <c:if test="${empty questions}">
                <div class="accordion-item">
                    <div class="accordion-header" onclick="toggleAccordion(this)">
                        <h2 class="accordion-title">Domanda</h2>
                        <i class="fas fa-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <ul class="answer-list">
                            <li class="answer-item">
                                <p class="answer-text">Risposta errata</p>
                            </li>
                            <li class="answer-item correct">
                                <i class="fas fa-check-circle answer-icon"></i>
                                <p class="answer-text">Risposta corretta</p>
                            </li>
                            <li class="answer-item">
                                <p class="answer-text">Risposta errata</p>
                            </li>
                            <li class="answer-item">
                                <p class="answer-text">Risposta errata</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <script>
        function toggleAccordion(header) {
            // Trova tutti gli accordion
            const allHeaders = document.querySelectorAll('.accordion-header');
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
                // Chiudi tutti gli accordion
                allContents.forEach(c => {
                    c.style.height = '0px';
                });
                allIcons.forEach(i => {
                    i.style.transform = 'rotate(0deg)';
                });
                
                // Apri l'accordion selezionato
                content.style.height = content.scrollHeight + 'px';
                icon.style.transform = 'rotate(180deg)';
            }
        }

        // Inizializza tutti gli accordion come chiusi
        document.addEventListener('DOMContentLoaded', function() {
            const contents = document.querySelectorAll('.accordion-content');
            contents.forEach(content => {
                content.style.height = '0px';
            });
        });
    </script>
</body>
</html>