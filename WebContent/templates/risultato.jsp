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
<!-- Bootstrap per gli elementi -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_risultato.css">
</head>
<body>

    <div class="risultato-container">
		<h1 class="congrats">Test completato</h1>
        
        <!-- Progress bar con ID per riferirsi a essa -->
        <div class="progress">
            <div id="progress-bar" class="progress-bar" role="progressbar" aria-valuenow="${risultato}" aria-valuemin="0" aria-valuemax="${ndomande}"></div>
        </div>
        
        <div class="contenuto-risultato">
            ${risultato}/${ndomande}
        </div>
		
		<a href="${pageContext.request.contextPath}/home"
			class="home-link">← Torna alla home</a>
	</div>

    <script>
        // Quando la pagina è completamente caricata
        window.onload = function() {
            var risultato = ${risultato};  // Ottieni il valore di 'risultato' dalla JSP
            var ndomande = ${ndomande};    // Ottieni il valore di 'ndomande' dalla JSP

            // Calcola la percentuale
            var percentuale = (risultato / ndomande) * 100;

            // Se la progress bar esiste, applica la larghezza dinamica con animazione
            var progressBar = document.getElementById('progress-bar');
            
            // Usando setTimeout per ritardare il cambiamento di larghezza
            setTimeout(function() {
                progressBar.style.width = percentuale + '%';  // Imposta la larghezza
                progressBar.setAttribute('aria-valuenow', risultato);  // Aggiorna il valore aria
            }, 100);  // Ritardo di 100 millisecondi
        };
    </script>

</body>
</html>