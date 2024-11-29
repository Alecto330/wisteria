<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    href="${pageContext.request.contextPath}/static/style_servizi.css">
<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
<title>Servizi - Wisteria Services</title>
</head>
<body>
    <!-- SEZIONE INTRO -->
    <section class="intro-section">
        <div class="text-content">
            <h4>SERVIZI</h4>
            <h1>Innovazione e soluzioni per il futuro</h1>
            <p>Offriamo una gamma completa di servizi tecnologici per supportarti nel tuo percorso verso il successo digitale.</p>
        </div>
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/assets/services.gif" class="persona">
        </div>
    </section>

    <!-- SEZIONE SERVIZI -->
    <section class="services-section">
        <h2>I Nostri Servizi</h2>
        <div class="services-container">
            <div class="service-item">
                <i class="fas fa-code service-icon"></i>
                <h3>Sviluppo Software</h3>
                <p>Diamo vita alle tue idee con soluzioni software personalizzate. Che si tratti di applicazioni desktop o piattaforme web scalabili, il nostro team di esperti si impegna a creare prodotti innovativi, ottimizzati per garantire prestazioni elevate e facilità d'uso.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-cogs service-icon"></i>
                <h3>Consulenza IT</h3>
                <p>Affrontare le sfide tecnologiche non è mai stato così semplice. Grazie alla nostra esperienza, siamo al tuo fianco per analizzare, ottimizzare e migliorare i processi aziendali, implementando le tecnologie più avanzate per un futuro di successo.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-shield-alt service-icon"></i>
                <h3>Cybersecurity</h3>
                <p>Proteggere i tuoi dati è la nostra priorità. Offriamo sistemi di sicurezza all'avanguardia per salvaguardare i tuoi asset aziendali da minacce informatiche, garantendo la continuità operativa e la tranquillità della tua attività.</p>
            </div>
        </div>
        <div class="services-container">
            <div class="service-item">
                <i class="fas fa-cloud service-icon"></i>
                <h3>Servizi Cloud</h3>
                <p>Espandi il tuo business con infrastrutture cloud affidabili, scalabili e sicure. Ottieni accesso a strumenti e piattaforme che rendono la gestione del tuo lavoro più semplice, flessibile e pronta a evolversi insieme alle tue esigenze.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-headset service-icon"></i>
                <h3>Supporto Tecnico</h3>
                <p>Hai un problema tecnologico? Siamo qui per aiutarti. Il nostro servizio di assistenza tecnica è sempre pronto a rispondere, fornendo soluzioni rapide ed efficaci per qualsiasi tipo di richiesta.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-project-diagram service-icon"></i>
                <h3>Gestione Progetti IT</h3>
                <p>Dalla pianificazione alla realizzazione, guidiamo i tuoi progetti IT con precisione e dedizione. Coordiniamo ogni fase per assicurare che le tue idee si trasformino in risultati tangibili, rispettando tempi e budget.</p>
            </div>
        </div>
    </section>

    <!-- SEZIONE CTA -->
    <section class="cta-section">
        <div class="cta-content">
            <h2>Pronto a trasformare la tua attività?</h2>
            <p>Contattaci oggi stesso per una consulenza gratuita e scopri come possiamo aiutarti a crescere.</p>
            <a href="mailto:info@wisteria.com" class="btn btn-primary">Contattaci</a>
        </div>
    </section>
</body>
</html>
