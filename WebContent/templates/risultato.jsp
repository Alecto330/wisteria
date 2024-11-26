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
	href="${pageContext.request.contextPath}/static/style_risultato.css">
</head>
<body>

    <div class="risultato-container">
		<h1 class="congrats">Test completato</h1>
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
        window.onload = function() {
            var risultato = ${risultato};
            var ndomande = ${ndomande};
            var percentuale = (risultato / ndomande) * 100;
            var progressBar = document.getElementById('progress-bar');
            setTimeout(function() {
                progressBar.style.width = percentuale + '%';
                progressBar.setAttribute('aria-valuenow', risultato);
            }, 100);
        };
    </script>

</body>
</html>
