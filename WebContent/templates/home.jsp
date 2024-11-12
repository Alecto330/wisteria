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
 <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>

<body>

    <div class="home-main container mt-5">
        <!-- Aggiungi align-items-end alla row -->
        <div class="row align-items-end">
            <!-- Testo Introduttivo -->
            <div class="col-lg-8 col-md-7 col-sm-12">
                <p class="introduction-title">Benvenuto!</p>
                <p class="introduction">
                    Wisteria è un'azienda <span class="highlight">leader nel
                        settore informatico</span> in Italia, riconosciuta per l'<span
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

            <!-- Carousel Allineato in Basso -->
            <div class="col-lg-4 col-md-5 col-sm-12 d-flex flex-column justify-content-end align-items-center">
                <div id="aboutUsCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
                    <ol class="carousel-indicators">
                        <li data-target="#aboutUsCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#aboutUsCarousel" data-slide-to="1"></li>
                        <li data-target="#aboutUsCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://www.bibopfashion.store/cdn/shop/files/0.47834800_1708711105.png?v=1708711107" class="d-block w-100" alt="Descrizione Immagine 1">
                        </div>
                        <div class="carousel-item">
                            <img src="https://www.bibopfashion.store/cdn/shop/files/0.47834800_1708711105.png?v=1708711107" class="d-block w-100" alt="Descrizione Immagine 2">
                        </div>
                        <div class="carousel-item">
                            <img src="https://www.bibopfashion.store/cdn/shop/files/0.47834800_1708711105.png?v=1708711107" class="d-block w-100" alt="Descrizione Immagine 3">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#aboutUsCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Precedente</span>
                    </a>
                    <a class="carousel-control-next" href="#aboutUsCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Successivo</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Container delle posizioni aperte -->
    <div class="container">

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

                        <input class="form-control mr-2" type="search" id="job-search"
                            placeholder="Cerca offerte di lavoro" style="background-color: #e3e3e3;">
                        <button class="btn btn-primary" onclick="performSearch()">Cerca</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <c:forEach var="job" items="${jobOffers}">
                <div class="col-md-6 mb-4">
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

    <!-- Riferimenti a Bootstrap JS e dipendenze -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
            const searchElem = document.getElementById("job-search");

            if (!regionElem || !professionElem || !searchElem) {
                console.error("Uno degli elementi di ricerca non è stato trovato.");
                return;
            }

            const selectedRegion = regionElem.value;
            const selectedProfession = professionElem.value;
            const searchQuery = searchElem.value;

            let searchUrl = '/wisteria/home?region='
                + encodeURIComponent(selectedRegion) + '&profession='
                + encodeURIComponent(selectedProfession) + '&search='
                + encodeURIComponent(searchQuery);

            window.location.href = searchUrl;
        }

        function setOptions() {
            const urlParams = new URLSearchParams(window.location.search);
            const region = urlParams.get('region');
            const profession = urlParams.get('profession');

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
        }

        window.addEventListener('popstate', setOptions);
        window.addEventListener('load', setOptions);
    </script>

</body>
</html>
