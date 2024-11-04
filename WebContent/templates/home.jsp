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
								<option value="Tutte">Tutte le regioni</option>
								<option value="Abruzzo">Abruzzo</option>
								<option value="Basilicata">Basilicata</option>
								<option value="Calabria">Calabria</option>
								<option value="Campania">Campania</option>
								<option value="Emilia-Romagna">Emilia-Romagna</option>
								<option value="Friuli-Venezia Giulia">Friuli-Venezia
									Giulia</option>
								<option value="Lazio">Lazio</option>
								<option value="Liguria">Liguria</option>
								<option value="Lombardia">Lombardia</option>
								<option value="Marche">Marche</option>
								<option value="Molise">Molise</option>
								<option value="Piemonte">Piemonte</option>
								<option value="Puglia">Puglia</option>
								<option value="Sardegna">Sardegna</option>
								<option value="Sicilia">Sicilia</option>
								<option value="Toscana">Toscana</option>
								<option value="Trentino-Alto Adige">Trentino-Alto Adige</option>
								<option value="Umbria">Umbria</option>
								<option value="Valle d'Aosta">Valle d'Aosta</option>
								<option value="Veneto">Veneto</option>
							</select>
						</div>

						<div class="select-wrapper">
							<select class="form-control mr-2" id="professioni">
								<option value="Tutte">Tutte le professioni</option>
								<option value="sviluppatore-backend">Sviluppatore
									Backend</option>
								<option value="sviluppatore-frontend">Sviluppatore
									Frontend</option>
								<option value="sviluppatore-full-stack">Sviluppatore
									Full Stack</option>
								<option value="ingegnere-devops">Ingegnere DevOps</option>
								<option value="data-scientist">Data Scientist</option>
								<option value="data-engineer">Data Engineer</option>
								<option value="analista-dati">Analista Dati</option>
								<option value="specialista-cybersecurity">Specialista
									Cybersecurity</option>
								<option value="ingegnere-software">Ingegnere Software</option>
								<option value="architetto-software">Architetto Software</option>
								<option value="product-manager">Product Manager</option>
								<option value="project-manager">Project Manager</option>
								<option value="qa-engineer">QA Engineer</option>
								<option value="tecnico-it">Tecnico IT</option>
								<option value="consulente-it">Consulente IT</option>
								<option value="esperto-cloud">Esperto Cloud</option>
								<option value="ux-designer">UX Designer</option>
								<option value="ui-designer">UI Designer</option>
								<option value="specialista-machine-learning">Specialista
									Machine Learning</option>
								<option value="specialista-ai">Specialista AI</option>
							</select>
						</div>

						<input style="background-color: #e3e3e3;"
							class="form-control mr-2" type="search"
							placeholder="Cerca offerte di lavoro">
						<button class="btn btn-primary">Cerca</button>
					</div>
				</div>

			</div>
		</div>


		<div class="row mt-4">
			<c:forEach var="job" items="${jobOffers}">
				<div class="col-md-6">
					<div class="card job-card" onclick="location.href='offerta.html';">
						<div class="card-body">
							<h5 class="card-title">${job.titolo}</h5>
							<p class="card-text">${job.descrizione}</p>
							<p class="card-location">
								<i class="fas fa-map-marker-alt"></i> ${job.localita}
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

	<!--############## FINE VISUALIZZA E CERCA POSIZIONI ################-->
</body>
</html>





		<!--<div class="row mt-4">
    <c:forEach var="job" items="${jobOffers}">
        <div class="col-md-6">
            <div class="card job-card" onclick="sendJobToServer(${fn:escapeXml(job)});">
                <div class="card-body">
                    <h5 class="card-title">${job.titolo}</h5>
                    <p class="card-text">${job.descrizione}</p>
                    <p class="card-location">
                        <i class="fas fa-map-marker-alt"></i> ${job.localita}
                    </p>
                    <p class="card-category">
                        <i class="fas fa-briefcase"></i> ${job.settore}
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    function sendJobToServer(job) {
        // Ensure the job is serialized safely
        fetch('offerta', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(job)
        }).then(response => {
            if (response.ok) {
                window.location.href = 'offerta.jsp';
            } else {
                console.error('Failed to send job to server:', response.statusText);
            }
        }).catch(error => {
            console.error('An error occurred:', error);
        });
    }
</script>-->
