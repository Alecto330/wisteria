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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_testcandidato.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
    <title>Quiz App</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	
	<div class="quiz-container">
        <h1 class="question-header">Domanda 3/10</h1>
        <p class="question-text">Quale linguaggio di programmazione è comunemente usato per lo sviluppo</p>
        
        <div class="options-container">
            <div class="option">
                <span class="option-text">a. Python</span>
                <div class="option-radio"></div>
            </div>
            <div class="option">
                <span class="option-text">b. JavaScript</span>
                <div class="option-radio selected"></div>
            </div>
            <div class="option">
                <span class="option-text">c. Java</span>
                <div class="option-radio"></div>
            </div>
            <div class="option">
                <span class="option-text">d. C++</span>
                <div class="option-radio"></div>
            </div>
        </div>

        <div class="navigation-buttons">
            <button class="nav-button prev" aria-label="Precedente">
                <i class="arrow arrow-left"></i>
            </button>
            <button class="nav-button next" aria-label="Successivo">
                <i class="arrow arrow-right"></i>
            </button>
        </div>
    </div>

    <script>
        document.querySelectorAll('.option').forEach(option => {
            option.addEventListener('click', () => {
                document.querySelectorAll('.option-radio').forEach(radio => {
                    radio.classList.remove('selected');
                });
                option.querySelector('.option-radio').classList.add('selected');
            });
        });
    </script>
	
		<%@ include file="footer.jsp"%>

</body>
</html>