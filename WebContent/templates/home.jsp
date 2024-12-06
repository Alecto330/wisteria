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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_home.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico"
	type="image/x-icon">
</head>

<body>
	<div class="home-main container mt-5 animate-on-scroll">
		<div class="row align-items-end animate-on-scroll">
			<div class="col-lg-8 col-md-7 col-sm-12 animate-on-scroll">
				<p class="introduction-title">We want you!</p>
				<p class="introduction">

					In <span class="highlight">Wisteria</span>, crediamo che il nostro
					<span class="highlight">successo</span> sia il risultato del <span
						class="highlight">talento</span>, della <span class="highlight">passione</span>
					e dell’<span class="highlight">impegno</span> delle persone che
					fanno parte del nostro team. Se sei alla ricerca di un ambiente <span
						class="highlight">dinamico</span>, <span class="highlight">stimolante</span>
					e in <span class="highlight">continua crescita</span>, sei nel
					posto giusto. Offriamo opportunità di carriera per professionisti
					motivati e desiderosi di fare la <span class="highlight">differenza</span>.
					Che tu sia un esperto del settore o un giovane talento, troverai in
					<span class="highlight">Wisteria</span> un ambiente che ti supporta
					e ti incoraggia a crescere. Se vuoi fare parte di una realtà che
					mette al centro le persone e la loro crescita, <span
						class="highlight">esplora</span> le posizioni aperte e <span
						class="highlight">candidati</span> oggi stesso!</br>
				</p>

				<p class="introduction" style="width: fit-content">
					Inizia la tua carriera con noi e <span class="highlight">costruisci</span>
					insieme a noi il <span class="highlight">futuro</span>.

				</p>
			</div>
			<div
				class="col-lg-4 col-md-5 col-sm-12 d-flex flex-column justify-content-end align-items-center animate-on-scroll">
				<div id="aboutUsCarousel" class="carousel slide"
					data-ride="carousel" data-interval="10000">
					<ol class="carousel-indicators">
						<li data-target="#aboutUsCarousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#aboutUsCarousel" data-slide-to="1"></li>
						<li data-target="#aboutUsCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active carousel-item1">
							<img
								src="${pageContext.request.contextPath}/assets/placeholder1.png"
								class="d-block w-100" alt="Descrizione Immagine 1">
						</div>
						<div class="carousel-item carousel-item2">
							<img
								src="${pageContext.request.contextPath}/assets/placeholder2.png"
								class="d-block w-100" alt="Descrizione Immagine 2">
						</div>
						<div class="carousel-item carousel-item3">
							<img
								src="${pageContext.request.contextPath}/assets/placeholder3.png"
								class="d-block w-100" alt="Descrizione Immagine 3">
						</div>
					</div>
					<a class="carousel-control-prev" href="#aboutUsCarousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Precedente</span>
					</a> <a class="carousel-control-next" href="#aboutUsCarousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Successivo</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container animate-on-scroll">

		<div class="row mt-4">
			<div class="col-md-12">
				<div class="custom-container">
					<div class="d-flex justify-content-start search-container">
						<div class="select-wrapper mr-2">
							<select class="form-control" id="regioni">
								<option value="" selected>Tutte le Regioni</option>
								<c:forEach var="region" items="${regionList}">
									<option value="${region}">${region}</option>
								</c:forEach>
							</select>
						</div>

						<div class="select-wrapper mr-2">
							<select class="form-control" id="professioni">
								<option value="" selected>Tutte le Professioni</option>
								<c:forEach var="profession" items="${professionList}">
									<option value="${profession}">${profession}</option>
								</c:forEach>
							</select>
						</div>
						<div class="select-wrapper mr-2">
							<select class="form-control" id="apertoChiuso">
								<option value="Aperte" selected>Aperte</option>
								<option value="Chiuse">Chiuse</option>
								<option value="Tutte">Tutte</option>
							</select>
						</div>
						<div>
							<input class="form-control mr-2 cercaOfferte" type="search"
								id="job-search" placeholder="Cerca offerte di lavoro"
								style="background-color: #e3e3e3;">
						</div>
						<button class="btn btn-primary" onclick="performSearch()">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<c:forEach var="job" items="${jobOffers}">
				<div class="col-md-6 mb-4">
				<c:choose>
					<c:when test="${job.utenteScelto != null}">
					<div class="card job-card animate-on-scroll selected-job">
						<div class="card-body">
						<div class="closed-header">
							<i class="fas fa-lock lock-icon" title="Posizione Chiusa"></i>
							<h5 class="card-title">${job.titolo}</h5>
							<a href="${pageContext.request.contextPath}/home" target="_blank" class="utente-scelto-title">Vincitore: @${job.utenteScelto}</a>
						</div>
					</c:when>
					<c:otherwise>
					<div class="card job-card animate-on-scroll"
						onclick="location.href='offerta?id=${job.id}';">
						<div class="card-body">
						<h5 class="card-title">${job.titolo}</h5>
					</c:otherwise>
				</c:choose>

					<pre class="card-text">${job.descrizione}</pre>
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
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2SANT3o6P8Q1F84HUyo8D+FKJka3izJ+7BSWQ5c6h1KjNZ7"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+LyXnJfFSN6CkB8zU5Fq+9v1K5r1hDqLw6v6hvzq/t7CJUMi1mBILR5l8"
		crossorigin="anonymous"></script>

	<script>
        function performSearch() {
            const regionElem = document.getElementById("regioni");
            const professionElem = document.getElementById("professioni");
            const apertoChiusoElem = document.getElementById("apertoChiuso");
            const searchElem = document.getElementById("job-search");

            if (!regionElem || !professionElem || !searchElem) {
                console.error("Uno degli elementi di ricerca non è stato trovato.");
                return;
            }

            const selectedRegion = regionElem.value;
            const selectedProfession = professionElem.value;
            const selectedApertoChiuso = apertoChiusoElem.value;
            console.log(selectedApertoChiuso);
            const searchQuery = searchElem.value;

            let searchUrl = '/wisteria/home?region='
                + encodeURIComponent(selectedRegion) + '&profession='
                + encodeURIComponent(selectedProfession) + '&ac='
                + encodeURIComponent(selectedApertoChiuso) + '&search='
                + encodeURIComponent(searchQuery);

            window.location.href = searchUrl;
        }

        function setOptions() {
            const urlParams = new URLSearchParams(window.location.search);
            const region = urlParams.get('region');
            const profession = urlParams.get('profession');
            const apertoChiuso = urlParams.get('ac');
            
            const regionSelect = document.getElementById('regioni');
            if (region && regionSelect) {
                const regionOption = regionSelect.querySelector(`option[value="${region}"]`);
                if (regionOption) {
                    regionOption.selected = true;
                } else {
                    regionSelect.selectedIndex = 0;
                }
            } else if (regionSelect) {
                regionSelect.selectedIndex = 0;
            }

            const professionSelect = document.getElementById('professioni');
            if (profession && professionSelect) {
                const professionOption = professionSelect.querySelector(`option[value="${profession}"]`);
                if (professionOption) {
                    professionOption.selected = true;
                } else {
                    professionSelect.selectedIndex = 0;
                }
            } else if (professionSelect) {
                professionSelect.selectedIndex = 0;
            }
            
            const apertoChiusoSelect = document.getElementById("apertoChiuso");
            if(apertoChiuso){
            apertoChiusoSelect.value=apertoChiuso;
            }
        }

        window.addEventListener('popstate', setOptions);
        window.addEventListener('load', setOptions);
    </script>
	<script>
        document.querySelectorAll('#aboutUsCarousel .carousel-control-prev, #aboutUsCarousel .carousel-control-next').forEach(button => {
            button.addEventListener('click', () => {
                button.blur();
            });
        });
    </script>

	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const jobCards = document.querySelectorAll(".job-card");

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
				{ threshold: 0.10 } // Attiva l'animazione quando il 40% è visibile
			);

			jobCards.forEach((card) => {
				card.classList.add("animate-on-scroll"); // Aggiunge lo stato iniziale
				observer.observe(card); // Osserva ogni card
			});
			});

	</script>

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
</body>
</html>
