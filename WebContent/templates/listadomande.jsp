<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista Domande</title>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/style_cercaDomande.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>
<body>
    <div class="container">
        <h1 class="title">Lista Domande</h1>
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="custom-container">
                    <div class="d-flex justify-content-start search-container">
                        <div class="select-wrapper mr-2">
                            <select class="form-control-dd" id="professioni">
                                <option value="" selected>Settori</option>
                                <c:forEach var="profession" items="${professionList}">
                                    <option value="${profession}">${profession}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input class="form-control mr-2 cercaOfferte" type="search" id="job-search"
                            placeholder="Cerca offerte di lavoro" style="background-color: #e3e3e3;">
                        <button class="btn btn-primary" onclick="performSearch()">Cerca</button>
                        <button class="btn btn-primary" style="margin-left: 35%; width:auto;" onclick="location.href='<%= request.getContextPath() %>/templates/creadomanda.jsp'">
                            Nuova
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion">
            <form id="questionsForm">
                <c:forEach var="question" items="${questions}" varStatus="status">
                    <div class="accordion-item">
                        <div class="accordion-header" onclick="toggleAccordion(this)">
                            <div class="selection-container">
                                <input type="checkbox" class="question-checkbox" name="selectedQuestions" value="${question.id}">
                            </div>
                            <h2 class="accordion-title">${question.domanda}</h2>
                            <i class="fas fa-chevron-down accordion-icon"></i>
                        </div>
                        <div class="accordion-content">
                            <ul class="answer-list">
                                <c:forEach var="answer" items="${question.risposte}">
                                    <li class="answer-item" data-vof="${answer.vof ? 'true' : ''}">
                                        <c:if test="${answer.vof}">
                                            <i class="fas fa-check-circle answer-icon"></i>
                                        </c:if>
                                        <p class="answer-text">${answer.risposta}</p>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </form>
        </div>
        <div class="actions-container">
            <button class="btn btn-primary btn-add" onclick="submitSelectedQuestions()">Aggiungi</button>
        </div>
    </div>

    <script>
        function toggleAccordion(header) {
            if (event.target.type === 'checkbox') {
                event.stopPropagation();
                return;
            }

            const allHeaders = document.querySelectorAll('.accordion-header');
            const allContents = document.querySelectorAll('.accordion-content');
            const allIcons = document.querySelectorAll('.accordion-icon');
            
            const content = header.nextElementSibling;
            const icon = header.querySelector('.accordion-icon');
            
            if (content.style.height && content.style.height !== '0px') {
                content.style.height = '0px';
                icon.style.transform = 'rotate(0deg)';
            } else {
              
                allContents.forEach(c => {
                    c.style.height = '0px';
                });
                allIcons.forEach(i => {
                    i.style.transform = 'rotate(0deg)';
                });
                
                content.style.height = content.scrollHeight + 'px';
                icon.style.transform = 'rotate(180deg)';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const contents = document.querySelectorAll('.accordion-content');
            contents.forEach(content => {
                content.style.height = '0px';
            });
        });

        // Funzione per eseguire azioni sulle domande selezionate
        function submitSelectedQuestions() {
            const form = document.getElementById('questionsForm');
            const selected = Array.from(form.selectedQuestions)
                                  .filter(checkbox => checkbox.checked)
                                  .map(checkbox => checkbox.value);
            if (selected.length === 0) {
                alert('Seleziona almeno una domanda.');
                return;
            }
            // Esegui l'azione desiderata con le domande selezionate
            // Ad esempio, invia il form o effettua una richiesta AJAX
            console.log('Domande selezionate:', selected);
            // Esempio di invio del form
            // form.submit();
        }


        // ############################### RICERCA ##############################
        function performSearch() {
            const settore = document.getElementById("professioni");
            const searchElem = document.getElementById("job-search");

            if (!settore || !searchElem) {
                console.error("Uno degli elementi di ricerca non è stato trovato.");
                return;
            }

            const selectedProfession = settore.value;
            const searchQuery = searchElem.value;

            let searchUrl = '/wisteria/home?settore='
                + encodeURIComponent(selectedProfession) + '&search='
                + encodeURIComponent(searchQuery);

            window.location.href = searchUrl;
        }

        function setOptions() {
            const urlParams = new URLSearchParams(window.location.search);
            const region = urlParams.get('settore');

            const regionSelect = document.getElementById('professioni');
            if (region && regionSelect) {
                const regionOption = regionSelect.querySelector(`option[value="${settore}"]`);
                if (regionOption) {
                    regionOption.selected = true;
                } else {
                    regionSelect.selectedIndex = 0;
                }
            } else if (regionSelect) {
                regionSelect.selectedIndex = 0;
            }

        }

        window.addEventListener('popstate', setOptions);
        window.addEventListener('load', setOptions);
    </script>
</body>
</html>
