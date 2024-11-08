<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_about.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<section class="intro-section">
		<div class="text-content">
			<h4>CHI SIAMO</h4>
			<h1>
				Connettiamo il presente,<br> progettiamo il futuro.
			</h1>
			<p>Scopri la storia, i valori e la missione di Wisteria, il tuo
				partner di fiducia per soluzioni innovative.</p>

		</div>
		<div class="image-content">
			<img src="${pageContext.request.contextPath}/assets/persona.png"
				class="persona">
		</div>
	</section>
	<section class="storia-section">
		<div class="p-storia">
			<div class="logo-wisteria">
				<img src="${pageContext.request.contextPath}/assets/logo-about2.png"
					class="wisteria-png">
			</div>
			<div class="storia-container">
				<div class="storia">
					Wisteria nasce con una visione chiara: utilizzare la tecnologia per
					migliorare la vita quotidiana delle persone e delle aziende. <br>Fin
					dall’inizio, Wisteria ha investito nell’innovazione continua,
					creando soluzioni digitali capaci di adattarsi alle esigenze di un
					mercato in costante evoluzione.<br> La nostra missione è
					semplice ma ambiziosa: trasformare le sfide tecnologiche in
					opportunità, con strumenti intuitivi e potenti che semplificano i
					processi e aumentano l’efficienza. <img
						src="${pageContext.request.contextPath}/assets/strettamano.png"
						class="persona2-png" alt="persona2">
				</div>
				<div class="number-container">
					<div class="number-inner">
						<div class="number-text">oltre</div>
						<div class="number-big">2300</div>
						<div class="number-text">dipendenti</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="business-section">
		<div class="image-content2">
			<img
				src="${pageContext.request.contextPath}/assets/business-woman.png"
				class="persona">
		</div>
		<div class="text-content2">
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
					<div class="number-big2">Puoi trovarci in tutta Italia!</div>
				</div>
			</div>
			<div class="image-italia">
				<img src="${pageContext.request.contextPath}/assets/italia.png"
					class="italia">
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>

</body>
</html>