<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_about.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">

<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">

</head>
	<body>

		<section class="intro-section">
			<div class="text-content animate-on-scroll loader">
				<h4>CHI SIAMO</h4>
				<h1>
					Connettiamo il presente,<br> progettiamo il futuro.
				</h1>
				<p>Scopri la storia, i valori e la missione di Wisteria, il tuo
					partner di fiducia per soluzioni innovative.</p>
			</div>
			<div class="image-content">
				<img src="${pageContext.request.contextPath}/assets/persona.png"
					class="persona animate-on-scroll loader">
			</div>
		</section>

		<section class="storia-section">
			<div class="p-storia">
				<div class="logo-wisteria">
					<img src="${pageContext.request.contextPath}/assets/WISTERIA.png"
						class="wisteria-png animate-on-scroll loader">
				</div>
				<div class="storia-container">
					<div class="storia animate-on-scroll loader">
						Wisteria nasce con una <span class="highlight">visione chiara</span>: utilizzare la <span class="highlight">tecnologia</span> per migliorare la vita 
						quotidiana delle persone e delle aziende. Fin dall'inizio, Wisteria ha investito nell'<span class="highlight">innovazione continua</span>, 
						creando soluzioni digitali capaci di adattarsi alle esigenze di un mercato in costante evoluzione.<br> 
						La nostra <span class="highlight">missione</span> è semplice ma <span class="highlight">ambiziosa</span>: trasformare le sfide tecnologiche in opportunità,<br>
						con strumenti <span class="highlight">intuitivi e potenti</span> che semplificano i processi e aumentano l'efficienza.<br>
						Grazie al nostro team di <span class="highlight">esperti visionari</span>, sviluppiamo 
						soluzioni all'avanguardia che anticipano le tendenze del futuro digitale. La nostra <span class="highlight">dedizione all'eccellenza</span> si riflette 
						in ogni progetto, dove l'attenzione al dettaglio si unisce alla ricerca costante della <span class="highlight">perfezione</span>. Con Wisteria, il <span class="highlight">futuro 
						tecnologico</span> diventa accessibile oggi, aprendo nuove strade verso il <span class="highlight">successo</span> nel mondo digitale.
					</div>
					<img src="${pageContext.request.contextPath}/assets/strettamano.png"
							class="persona2-png animate-on-scroll loader" alt="persona2">
					<div class="number-container">
							<div class="number-text animate-on-scroll loader">oltre</div>
							<div class="number-big animate-on-scroll loader">2300</div>
							<div class="number-text animate-on-scroll loader">dipendenti</div>
					</div>
				</div>
			</div>
		</section>

		<section class="business-section">
			<div class="image-content2">
				<img
					src="${pageContext.request.contextPath}/assets/business-woman.png"
					class="persona animate-on-scroll loader">
			</div>
			<div class="text-content2 animate-on-scroll loader">
				<h4>SUPPORTO</h4>
				<h1>
					Sempre connessi, sempre presenti.<br> Soluzioni in tempo reale,
					<br>sempre.
				</h1>
				<p>
					Affidati a noi per ricevere sempre supporto immediato, <br>con
					soluzioni semplici e sicure.
				</p>
			</div>
		</section>

		<section class="italia-section">
			<div class="italia-container2">
				<div class="number-container2">
					<div class="number-inner2">
						<div class="number-big2 animate-on-scroll loader">Puoi trovarci in tutta Italia!</div>
					</div>
				</div>
				<div class="image-italia">
					<img src="${pageContext.request.contextPath}/assets/italia.png"
						class="italia animate-on-scroll loader">
				</div>
			</div>
			<div class="btn-container">
				<a href="/wisteria/home" class="btn btn-back animate-on-scroll loader" href="javascript:history.back();">
					Torna alla Home
				</a>
			</div>
		</section>
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