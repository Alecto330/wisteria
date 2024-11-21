<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista Domande</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_cercaDomande.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
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
            <button class="btn btn-primary btn-add" onclick="submitSelectedQuestions()">Salva</button>
        </div>
    </div>

	<script>
    
    function checkSelected() {
        console.log("Checking selected questions...");
        const params = new URLSearchParams(window.location.search);
        const questions = params.getAll('question'); // Get all selected question IDs from the URL query

        // Iterate through each checkbox and check if it matches a selected question
        const checkboxes = document.querySelectorAll('.question-checkbox');
        checkboxes.forEach(checkbox => {
            if (questions.includes(checkbox.value)) {
                checkbox.checked = true;
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Ensure checkboxes are selected if needed on page load
        checkSelected();
        
        const contents = document.querySelectorAll('.accordion-content');
        contents.forEach(content => {
            content.style.height = '0px';
        });
    });
    
    function nuovaDomanda(){
    	 const params = new URLSearchParams(window.location.search);
    	 const titolo=params.get('titolo');
    	 const descrizione=params.get('descrizione');
    	 
    	 console.log(titolo);
    	 console.log(descrizione);
    	 
    	 const selectedCheckboxes = document.querySelectorAll('.question-checkbox:checked'); 
      
         const selectedQuestions = []; 
          
         selectedCheckboxes.forEach(checkbox => { 
             selectedQuestions.push(encodeURIComponent(checkbox.value)); 
         });
         
        const baseUrl = '${pageContext.request.contextPath}/creadomanda';
        const urlWithParams = baseUrl+'?titolo='+titolo+'&descrizione='+descrizione+'&'+selectedQuestions.map(q => 'question=' + q).join('&');
         
        location.href = urlWithParams;
    }

    
    
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

        
        function submitSelectedQuestions() { 
            const selectedCheckboxes = document.querySelectorAll('.question-checkbox:checked'); 
         
            if (selectedCheckboxes.length === 0) { 
                alert('Seleziona almeno una domanda prima di inviare.'); 
                return; 
            } 
         
            const selectedQuestions = []; 
             
            selectedCheckboxes.forEach(checkbox => { 
                selectedQuestions.push(encodeURIComponent(checkbox.value)); 
            });
         
            const url = '/wisteria/creaposizione?' + selectedQuestions.map(q => 'question=' + q).join('&')+'&titolo=${titolo}&descrizione=${descrizione}'; 
         
            fetch(url, { 
                method: 'GET',
                headers: {
                    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
                },
                credentials: 'same-origin'
            }) 
            .then(response => {
                // Check if the response is a redirect
                if (response.redirected) {
                    // If server sent a redirect, follow it
                    window.location.href = response.url;
                    return;
                }
                
                // Otherwise, process the response
                return response.text();
            })
            .then(html => {
                if (html) {
                    // Update URL without page reload
                    history.pushState(null, '', url);
                    
                    // Update page content
                    document.open();
                    document.write(html);
                    document.close();
                }
            })
            .catch(error => { 
                console.error('Errore:', error); 
                alert('Si è verificato un errore durante l\'invio: ' + error.message); 
            }); 
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



window.addEventListener('scroll', function() {
    const footer = document.querySelector('footer'); // Il tuo footer
    const button = document.querySelector('.btn-add');

    if (footer && button) {
        const footerRect = footer.getBoundingClientRect(); // Ottieni la posizione del footer
        const windowHeight = window.innerHeight; // Altezza della finestra di visualizzazione

        // Se il footer è vicino al fondo della finestra
        if (footerRect.top <= windowHeight && footerRect.top > 0) {
            // Solo se il pulsante non è già in posizione assoluta, cambiamo la posizione
            if (button.style.position !== 'absolute') {
                button.style.position = 'absolute'; // Cambiamo a 'absolute'
                button.style.bottom = (footerRect.height + 20) + 'px'; // Posizionalo sopra il footer
                button.style.transition = 'none'; // Evitiamo transizioni rapide durante il cambio
            }
        } else {
            // Quando il footer non è vicino, il bottone deve rimanere fisso
            if (button.style.position !== 'fixed') {
                button.style.position = 'fixed'; // Torniamo alla posizione 'fixed'
                button.style.bottom = '20px'; // Mantienilo 20px sopra il fondo
                button.style.transition = 'none';  // Transizione fluida per tornare
            }
        }
    }
});








    </script>
</body>
</html>
