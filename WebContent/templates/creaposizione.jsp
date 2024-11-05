<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font-Awesome per le icone (senz doverle scaricare) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_creaposizione.css">

    <title>Aggiungi Posizione</title>

</head>
<body>

	<%@ include file="header.jsp"%>

	
	<div class="main-container-creaposizione">
        <h1 class="form-title">Aggiungi posizione</h1>

        <div class="form-grid">
            <div class="form-group">
                <label class="form-label">Titolo:</label>
                <input type="text" class="form-input" placeholder="Inserisci il titolo della posizione">
            </div>

            <div class="form-group">
                <label class="form-label">Descrizione:</label>
                <input type="text" class="form-input" placeholder="Inserisci la descrizione">
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Località:</label>
            <div class="location-group">
                <select class="form-select">
                    <option value="" disabled selected>Regione</option>
                    <option>Lombardia</option>
                    <option>Lazio</option>
                    <option>Piemonte</option>
                </select>

                <select class="form-select">
                    <option value="" disabled selected>Provincia</option>
                    <option>Milano</option>
                    <option>Roma</option>
                    <option>Torino</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Settore:</label>
            <select class="form-select">
                <option value="" disabled selected>Tutte le professioni</option>
                <option>IT e Tecnologia</option>
                <option>Marketing</option>
                <option>Vendite</option>
                <option>Amministrazione</option>
            </select>
        </div>

        <div class="questions-section">
            <h3 class="questions-title">Aggiungi domanda</h3>
            <input type="text" class="question-input" placeholder="Quale KPI è fondamentale per un Sales Manager?">
            <button class="add-question-btn">+</button>
        </div>

        <button class="create-btn">Crea</button>
    </div>
	
	
	<%@ include file="footer.jsp"%>

</body>
</html>