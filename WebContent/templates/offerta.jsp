
<%@page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_offerta.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>

<body>


   <div class="offerta-container">
        <div class="offer-card container-custom mt-5 animate-on-scroll loader">
            <div class="row align-items-start">
                <div class="col-sm-8">
                    <h1>${posizione.titolo}</h1>
                    <div class="dettagli-offerta">
                        <p class="p-posizione"><i class="fas fa-map-marker-alt"></i> ${posizione.provincia} - ${posizione.regione}</p>
                        <p class="p-settore"><i class="fas fa-briefcase"></i> ${posizione.settore}</p>
                    </div>
                </div>
                <div class="col-sm-4 text-end">
                    <button class="btn btn-apply" onclick="location.href='test?idPosizione=${posizione.id}&nomePosizione=${posizione.titolo}';">Candidati ora!</button>
                </div>
            </div>
            <hr>
            <div class="details-section">
                <h5>Descrizione Lavoro</h5>
                <p>${posizione.descrizione}</p>
            </div>
			<div class="back-btn-container">
				<a class="back-button" href="javascript:history.back();"> <i
					class="fas fa-arrow-left"></i>
				</a>
			</div>
        </div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
			document.addEventListener("DOMContentLoaded", function () {
				const elements = document.querySelectorAll(".animate-on-scroll");

				const observer = new IntersectionObserver(
					(entries) => {
						entries.forEach((entry) => {
							if (entry.isIntersecting) {
								entry.target.classList.add("visible"); // Applica l'animazione
								observer.unobserve(entry.target); // Smetti di osservarlo dopo l'animazione
							}
						});
					},
					{ threshold: 0.0 } // Inizia l'animazione quando il 10% dell'elemento è visibile
				);

				elements.forEach((element) => observer.observe(element));
			});

	</script>
	<script>
			document.addEventListener("DOMContentLoaded", function () {
				const loader = document.querySelectorAll(".loader");

				const observer = new IntersectionObserver(
					(entries) => {
					entries.forEach((entry) => {
						if (entry.isIntersecting) {
						entry.target.classList.add("visible");
						} else {
						entry.target.classList.remove("visible");
						}
					});
					},
					{ threshold: 0.1 } // Attiva l'animazione quando il 40% è visibile
				);

				loader.forEach((card) => {
					card.classList.add("animate-on-scroll"); // Aggiunge lo stato iniziale
					observer.observe(card); // Osserva ogni card
				});
			});
	</script>
</body>
</html>
