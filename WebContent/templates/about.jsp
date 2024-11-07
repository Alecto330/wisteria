<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="it">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Offerte di Lavoro</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap per gli elementi -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font-Awesome per le icone (senz doverle scaricare) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<!-- Per importare il font Poppins -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
</head>

<body>
	<%@ include file="header.jsp"%>

	<div class="home-main">
		<p class="introduction-title">Benvenuto!</p>
		<p class="introduction">
			Wisteria è un'azienda <span class="highlight">leader nel
				settore informatico</span> in Italia, riconosciuta <br> per l'<span
				class="highlight">innovazione</span> e l’<span class="highlight">eccellenza</span>
			delle <span class="highlight">soluzioni digitali</span>. La nostra
			esperienza nel campo tecnologico ha portato alla creazione di una <span
				class="highlight">piattaforma avanzata</span> per <span
				class="highlight">semplificare il processo di reclutamento</span>,
			garantendo un'interazione efficace e trasparente tra candidati e
			datori di lavoro.<br> Questa nuova web app consente ai datori di
			lavoro di <span class="highlight">pubblicare offerte</span>, <span
				class="highlight">filtrare candidature</span> e gestire in modo
			ottimale il processo di selezione. <br> Al tempo stesso, i
			candidati possono <span class="highlight">monitorare lo stato
				delle proprie domande</span> e ricevere aggiornamenti in tempo reale,
			accedendo a una piattaforma <span class="highlight">intuitiva
				e facile da usare</span>. Wisteria si impegna a connettere talenti e
			opportunità, facilitando ogni fase del percorso di selezione con un
			approccio <span class="highlight">innovativo</span> e <span
				class="highlight">user-friendly</span>.
		</p>

	</div>
	<!-- Cointanier delle posizioni aperte -->
	<div class="container">

		<div class="row mt-4">
			<div class="col-md-12">
				<div class="custom-container">
					<div class="d-flex justify-content-start search-container">
						<div class="select-wrapper">
							<select class="form-control mr-2" id="regioni">
								<option value="" selected id="regionOption">Tutte le Regioni</option>
								<c:forEach var="region" items="${regionList}">
									<option value="${region}" id="${region}">${region}</option>
								</c:forEach>
							</select>
						</div>

						<div class="select-wrapper">
							<select class="form-control mr-2" id="professioni">
								<option value="" selected id="professionOption">Tutte le Professioni</option>
								<!-- Default option -->
								<c:forEach var="profession" items="${professionList}">
									<option value="${profession}" id="${profession}">${profession}</option>
								</c:forEach>
							</select>
						</div>


						<input style="background-color: #e3e3e3;"
							class="form-control mr-2" type="search" id="job-search"
							placeholder="Cerca offerte di lavoro">
						<button class="btn btn-primary" onclick="performSearch()">Cerca</button>
					</div>
				</div>
			</div>
		</div>


		<div class="row mt-4">
			<c:forEach var="job" items="${jobOffers}">
				<div class="col-md-6">
					<div class="card job-card"
						onclick="location.href='offerta?id=${job.id}';">
						<div class="card-body">
							<h5 class="card-title">${job.titolo}</h5>
							<p class="card-text">${job.descrizione}</p>
							<p class="card-location">
								<i class="fas fa-map-marker-alt"></i> ${job.provincia} -
								${job.regione}
							</p>
							<p class="card-category">
								<i class="fas fa-briefcase"></i> ${job.settore}
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script>
		function performSearch() {
			const regionElem = document.getElementById("regioni");
			const professionElem = document.getElementById("professioni");
			const searchElem = document.getElementById("job-search");

			if (!regionElem) {
				console.error("Element with id 'regioni' not found");
				return;
			}
			if (!professionElem) {
				console.error("Element with id 'professioni' not found");
				return;
			}
			if (!searchElem) {
				console.error("Element with id 'job-search' not found");
				return;
			}

			const selectedRegion = regionElem.value;
			const selectedProfession = professionElem.value;
			const searchQuery = searchElem.value;

			console.log("Selected Region:", selectedRegion);
			console.log("Selected Profession:", selectedProfession);
			console.log("Search Query:", searchQuery);

			let searchUrl = '/wisteria/home?region='
					+ encodeURIComponent(selectedRegion) + '&profession='
					+ encodeURIComponent(selectedProfession) + '&search='
					+ encodeURIComponent(searchQuery);

			console.log(searchUrl);

			window.location.href = searchUrl;

		}

		function setOptions() {
		    const urlParams = new URLSearchParams(window.location.search);
		    const region = urlParams.get('region');
		    const profession = urlParams.get('profession');

		    const regionSelect = document.getElementById('regioni');

		    if (region) {
		        const regionOption = regionSelect.querySelector(`option[value="${region}"]`);
		        if (regionOption) {
		            regionOption.selected = true;
		        }
		    } else {
		        regionSelect.selectedIndex = 0;
		    }
		    
		    const professionSelect = document.getElementById('professioni');

		    if (profession) {
		        const professionOption = professionSelect.querySelector(`option[value="${profession}"]`);
		        if (professionOption) {
		        	professionOption.selected = true;
		        }
		    } else {
		        professionSelect.selectedIndex = 0;
		    }
		    
		}

		window.addEventListener('popstate', setOptions());
		window.addEventListener('load', setOptions());  // Run when the page loads
	</script>

</body>
</html>


