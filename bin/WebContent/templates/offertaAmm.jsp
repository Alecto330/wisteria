<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_offertaAmm.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>
<body>

	<div class="content-container contenuto">
		<div class="card">
			<div class="scroll-wrapper-classifica">
				<div class="job-header" style="margin-top: 5px">
					<h1 class="job-title">${posizione.titolo}</h1>
					<button class="btn btn-primary" style="margin-left: auto;"
						onclick="cancellaPosizione">Cancella</button>
					<button class="btn btn-primary" onclick="ChiudiPosizione">Chiudi</button>
				</div>
				<div class="job-meta">
					<div class="meta-item">
						<span class="meta-icon">📍</span> <span>${posizione.provincia}
							- ${posizione.regione}</span>
					</div>
					<div class="meta-item">
						<span class="meta-icon">🏢</span> <span>${posizione.settore}</span>
					</div>
				</div>

				<h2 class="section-title">Descrizione azienda</h2>
				<div class="job-description">Lantech Longwave, società del
					Gruppo Zucchetti, prima software house in Europa con più di 8000
					addetti, si occupa della progettazione e dell'implementazione di
					soluzioni e servizi tecnologici innovativi, sicuri e performanti
					negli ambiti Security, Networking, Datacenter & Cloud,
					Collaboration & AVI e Sviluppo Software.</div>

				<div class="company-location">È presente in tredici sedi
					dislocate in nove città italiane e una in Svizzera: Reggio Emilia,
					Bologna, Padova, Verona, Milano, Besana Brianza, Roma, Modena,
					Parma e Chiasso.</div>

				<div class="job-description">Il Team di oltre 300
					collaboratori opera con l'obiettivo di rendere la tecnologia alla
					portata di tutti. Ogni soluzione ICT viene pensata e progettata
					partendo dalle persone e, attraverso uno studio di fattibilità,
					viene definita la tecnologia più adeguata alla specifica esigenza,
					in termini di performance, affidabilità e sicurezza.</div>

				<div class="job-description">
					Ha ingegnerizzato una suite di servizi gestiti - LION® - erogati
					h24 7*7 per garantire un monitoraggio real-time e una gestione
					continua in massima sicurezza dell'intera infrastruttura ICT delle
					aziende. <br>
					<br> <a href="http://www.lantechlongwave.it"
						class="website-link">www.lantechlongwave.it</a>
				</div>

				<div class="job-position">
					<h2 class="section-title">Posizione</h2>
					<div class="job-description">Il/La candidato/a, che
						risponderà alla Direzione aziendale sarà inserito/a
						nell'organizzazione per gestire e monitorare i budget aziendali
						occupandosi del monitoraggio e analisi delle performance...</div>
				</div>
			</div>
		</div>

		<div class="card">
			<div class="scroll-wrapper-classifica">
				<h2 class="ranking-title">Classifica</h2>


				<c:forEach var="candidate" items="${candidates}" varStatus="loopStatus">
					<div class="ranking-item"
						onclick="window.location.href='${pageContext.request.contextPath}/visualizzacandidato?id=${candidate.utente}'"
						style="cursor: pointer">
						<div class="candidate-info">
							<span class="rank-number">${loopStatus.index + 1}°</span> <span
								class="medal-icon"><c:if test="${loopStatus.index + 1 == 1}"><i class="fa-solid fa-trophy"></i> <!-- Font Awesome trophy icon --></c:if></span>
							<span class="candidate-name">${candidate.utente}</span>
						</div>
						<span class="candidate-score">${candidate.punteggio}/10</span>
					</div>
				</c:forEach>

			</div>
		</div>

	</div>
</body>
</html>