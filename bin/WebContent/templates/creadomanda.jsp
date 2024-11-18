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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_creadomanda.css">
    <title>Aggiungi Nuova Domanda</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>
<body>

	<%@ include file="header.jsp"%>
	
	
	<div class="main-container-creadomanda">
        <h1 class="form-title">Aggiungi Domanda</h1>

        <label class="question-label">Testo della domanda :</label>
        <input type="text" class="question-input" placeholder="Inserisci la domanda">

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

        <button class="create-btn">Crea</button>
    </div>

    <script>
        document.querySelectorAll('.answer-input').forEach(input => {
            input.addEventListener('focus', () => {
                const radioInput = input.previousElementSibling.querySelector('input[type="radio"]');
                radioInput.checked = true;
            });
        });
    </script>
	
		<%@ include file="footer.jsp"%>

</body>
</html>