<%@page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"> 
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
    
    <title>Dettagli Posizione Lavorativa</title>
    
    <style>
        body {
            height: 100%;
            width: 100%;
            align-items: center;
            justify-content: center;
            background-image: linear-gradient(130deg, rgba(255, 255, 255, 0.8), rgba(230, 230, 230, 0.8), rgba(165, 48, 255, 0.8)), url("../assets/bg-blurrato.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat; 
            font-family: 'Poppins', sans-serif;
        }
        .logo-button-wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .company-logo {
            width: 70px;
            height: 70px;
            background-color: #D7A9E3;
            border-radius: 50%;
        }
        .login-button {
            background-color: #D7A9E3;
            color: black;
            border: 2px solid black;
            padding: 10px 30px;
            border-radius: 10px;
        }
        .offer-card {
            padding: 2vw;
            background-color: #d8aef7;
            border-radius: 20px;
            color: black;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .offer-card h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .btn-apply {
            background-color: #D6B5FF;
            border: solid 2px #8228ff;
            border-radius: 2vw;
            color: black;
            box-shadow: 0 0 5px rgb(130, 40, 255), 0 0 10px rgba(131, 40, 255, 0.6);
            transition: background-color 0.3s, transform 0.3s ease-in-out;
        }
        .btn-apply:hover {
            color: #fff;
            background-color: #8228ff;
            border-color: #8228ff;
            transform: scale(1.01);
        }
        .details-section p {
            font-size: 1rem;
            line-height: 1.6;
        }
        .btn-back {
            background-color: transparent;
            color: rgb(0, 0, 0);
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-top: 30px;
            padding-left: 0;
            transition: transform 0.3s ease, color 0.3s ease;
            font-size: 20px;
        }
        .btn-back:hover {
            color: rgb(123, 31, 255);
            transform: translateX(-5px);
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-bottom: 50px;
        }
        .offerta-container {
            margin-top: 185px;
            max-width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        .footer {
            margin-top: 200px;
        }
        @media (max-width: 768px) {
            .offerta-container {
                max-width: 90%;
                margin-top: 100px;
            }
            .offer-card {
                padding: 1.5vw;
            }
            .btn-apply {
                width: 100%;
                margin-top: 15px;
            }
        }
    </style>
</head>
<body>
    <main class="offerta-container">
        <!-- Header della Offerta -->
        <section class="offer-card">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-8 col-md-7">
                        <h1>${posizione.titolo}</h1>
                        <div class="dettagli-offerta">
                            <p class="p-posizione"><i class="fas fa-map-marker-alt"></i> ${posizione.provincia} - ${posizione.regione}</p>
                            <p class="p-settore"><i class="fas fa-briefcase"></i> ${posizione.settore}</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 text-lg-right text-md-right text-sm-left mt-3 mt-md-0">
                        <button class="btn btn-apply" onclick="location.href='test?idPosizione=${posizione.id}&nomePosizione=${posizione.titolo}';">Candidati subito!</button>
                    </div>
                </div>
            </div>

            <hr>

            <!-- Sezione Dettagli -->
            <section class="details-section">
                <h5>Descrizione Lavoro</h5>
                <p>${posizione.descrizione}</p>

                <h5>Posizione</h5>
                <p>Il/la candidato/a, che risponderà alla Direzione aziendale sarà inserito/a nell’organizzazione...</p>

                <h5>La risorsa si occuperà delle seguenti attività:</h5>
                <ul>
                    <li>Analisi e pianificazione finanziaria dell’azienda</li>
                    <li>Monitoraggio e definizione di costi, ricavi e predisposizione dei budget</li>
                    <li>Analisi degli scostamenti, analisi di cash flow</li>
                    <li>Collaborazione per l’impostazione dei sistemi di contabilità analitica</li>
                    <li>Collaborazione costante con i dipartimenti aziendali</li>
                </ul>
            </section>
        </section>

        <!-- Pulsante Indietro -->
        <div class="btn-container">
            <a href="javascript:history.back();" class="btn btn-back">
                <i class="fas fa-arrow-left"></i> Torna Indietro
            </a>
        </div>
    </main>

    <!-- Footer (se necessario) -->
    <footer class="footer text-center">
        <!-- Contenuto del footer -->
    </footer>

    <!-- Bootstrap JS e dipendenze -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
        integrity="sha384-DfXdHC1yN3XrD5U05EfKJAdqCdg+L9Ew9f8t6ygHUlYVf2ZkcT3Br10dUcs3bV7B" 
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-LtrjvnR4Twt/qOuYxwGwDpl3Rg5GwHZPGKCh1oI3eBKKx91s6Cttl9uIqIXyE3V7" 
        crossorigin="anonymous"></script>
</body>
</html>
