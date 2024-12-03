<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="text-content animate-on-scroll">
            <h4>SERVIZI</h4>
            <h1>Innovazione e soluzioni per il futuro</h1>
            <p>Offriamo una gamma completa di servizi tecnologici per supportarti nel tuo percorso verso il successo digitale.</p>
        </div>
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/assets/services.gif" class="persona animate-on-scroll">
        </div>
    </section>

    <!-- SEZIONE SERVIZI -->
    <section class="services-section">
        <div class="margin">
            <h2 class="animate-on-scroll loader">I Nostri Servizi</h2>
            <div class="services-container animate-on-scroll loader">
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-code service-icon"></i>
                    <h3>Sviluppo Software</h3>
                    <p>Diamo vita alle tue idee con soluzioni software personalizzate. Che si tratti di applicazioni desktop o piattaforme web scalabili, il nostro team di esperti si impegna a creare prodotti innovativi, ottimizzati per garantire prestazioni elevate e facilità d'uso.</p>
                </div>
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-cogs service-icon"></i>
                    <h3>Consulenza IT</h3>
                    <p>Affrontare le sfide tecnologiche non è mai stato così semplice. Grazie alla nostra esperienza, siamo al tuo fianco per analizzare, ottimizzare e migliorare i processi aziendali, implementando le tecnologie più avanzate per un futuro di successo.</p>
                </div>
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-shield-alt service-icon"></i>
                    <h3>Cybersecurity</h3>
                    <p>Proteggere i tuoi dati è la nostra priorità. Offriamo sistemi di sicurezza all'avanguardia per salvaguardare i tuoi asset aziendali da minacce informatiche, garantendo la continuità operativa e la tranquillità della tua attività.</p>
                </div>
            </div>
            <div class="services-container animate-on-scroll loader">
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-cloud service-icon"></i>
                    <h3>Servizi Cloud</h3>
                    <p>Espandi il tuo business con infrastrutture cloud affidabili, scalabili e sicure. Ottieni accesso a strumenti e piattaforme che rendono la gestione del tuo lavoro più semplice, flessibile e pronta a evolversi insieme alle tue esigenze.</p>
                </div>
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-headset service-icon"></i>
                    <h3>Supporto Tecnico</h3>
                    <p>Hai un problema tecnologico? Siamo qui per aiutarti. Il nostro servizio di assistenza tecnica è sempre pronto a rispondere, fornendo soluzioni rapide ed efficaci per qualsiasi tipo di richiesta.</p>
                </div>
                <div class="service-item animate-on-scroll loader">
                    <i class="fas fa-project-diagram service-icon"></i>
                    <h3>Gestione Progetti IT</h3>
                    <p>Dalla pianificazione alla realizzazione, guidiamo i tuoi progetti IT con precisione e dedizione. Coordiniamo ogni fase per assicurare che le tue idee si trasformino in risultati tangibili, rispettando tempi e budget.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- SEZIONE CTA -->
    <section class="cta-section">
        <div class="cta-content animate-on-scroll loader">
            <h2>Pronto a trasformare la tua attività?</h2>
            <p>Contattaci oggi stesso per una consulenza gratuita e scopri come possiamo aiutarti a crescere.</p>
            <a href="mailto:info@wisteria.com" class="btn btn-back">Contattaci</a>
        </div>
    </section>

     <section class="recensioni-section">
        <div class="margin">
            <h2 class="animate-on-scroll loader">Recensioni dei Nostri Clienti</h2>
            <div class="carousel animate-on-scroll">
                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"Wisteria Services ha fatto la differenza per il nostro business. La loro consulenza strategica ci ha permesso di ottimizzare i nostri processi e migliorare l'efficienza operativa." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Giulia Tosi, CEO di Innovatech</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"Con Wisteria Services, abbiamo finalmente trovato un partner tecnologico su cui possiamo fare affidamento. Le soluzioni IT personalizzate che ci hanno fornito sono state cruciali per il nostro successo." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Marco Ferri, CTO di WebSolutions</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"La loro expertise nel Cloud ci ha permesso di scalare il nostro business senza intoppi. Il team di Wisteria Services è davvero un punto di riferimento per l'innovazione." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Francesca Rossi, Direttore IT di FutureCom</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"Abbiamo collaborato con Wisteria Services per l'implementazione di soluzioni software avanzate. La loro capacità di comprendere le nostre necessità aziendali ha portato a risultati straordinari." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Paolo Neri, Fondatore di NextGen Software</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"Grazie a Wisteria Services, la nostra azienda è riuscita a ridurre i costi operativi e a migliorare l'affidabilità dei nostri sistemi IT. Consiglio vivamente i loro servizi a chi cerca soluzioni innovative e su misura." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Laura Conti, Responsabile Operations di GreenTech</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"La partnership con Wisteria Services ci ha permesso di evolvere digitalmente e restare competitivi sul mercato. Un team di professionisti preparati e attenti alle esigenze del cliente." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Alessio Moretti, Direttore Commerciale di Tech Innovators</span>
                </div>

                <div class="carousel-item">
                    <i class="fas fa-quote-left icon"></i>
                    <p class="quote">"Il team di Wisteria Services ha reso l'implementazione delle soluzioni IT per la nostra azienda facile e senza stress. Hanno sempre risposto alle nostre esigenze con prontezza e precisione." </p>
                    <i class="fas fa-quote-right icon"></i>
                    <span class="author">- Luigi Carli, Chief Marketing Officer di Global Corp</span>
                </div>
            </div>
            <button class="prev-btn animate-on-scroll loader">&lt;</button>
            <button class="next-btn animate-on-scroll loader">&gt;</button>
        </div>
    </section>


    <script>

        document.addEventListener('DOMContentLoaded', () => {
            const carousel = document.querySelector('.carousel');
            const items = document.querySelectorAll('.carousel-item');
            const prevBtn = document.querySelector('.prev-btn');
            const nextBtn = document.querySelector('.next-btn');
            let currentIndex = 0;
            const itemWidth = 800; // Larghezza di ogni elemento
            const gap = 20; // Spazio tra gli elementi
            const totalItemWidth = itemWidth + gap; // Larghezza totale di ogni item con il gap

            console.log("Carosello e pulsanti trovati:", carousel, prevBtn, nextBtn, items);
            console.log("Indice corrente iniziale:", currentIndex); // Log iniziale

            function updateCarousel() {
                console.log("Aggiornamento carosello...");
                console.log("Indice corrente durante update:", currentIndex); // Log prima dell'aggiornamento

                const offset = -currentIndex * totalItemWidth; // Calcola l'offset in base alla larghezza totale dell'item
                console.log("Spostamento del carosello a: " + offset + "px");

                carousel.style.transform = 'translateX(' + offset + 'px)'; // Sposta il carosello
            }

            prevBtn.addEventListener('click', () => {
                console.log("Pulsante precedente cliccato.");
                // Ciclo tra gli item: se è il primo, torna all'ultimo
                currentIndex = (currentIndex === 0) ? items.length - 1 : currentIndex - 1;
                console.log("Indice corrente (precedente):", currentIndex);
                updateCarousel();
            });

            nextBtn.addEventListener('click', () => {
                console.log("Pulsante successivo cliccato.");
                // Ciclo tra gli item: se è l'ultimo, torna al primo
                currentIndex = (currentIndex === items.length - 1) ? 0 : currentIndex + 1;
                console.log("Indice corrente (successivo):", currentIndex);
                updateCarousel();
            });

            // Inizializza il carosello
            updateCarousel();
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
