<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font-Awesome per le icone (senz doverle scaricare) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_classifica.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <title>Posizione e Classifica</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="header.jsp"%>
	
	 <div class="content-container">
        <div class="card">
            <div class="scroll-wrapper-classifica">
                <h1 class="job-title">Sviluppatore Full Stack</h1>
                <div class="job-meta">
                    <div class="meta-item">
                        <span class="meta-icon">📍</span>
                        <span>Parma - Italia</span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-icon">🏢</span>
                        <span>Amministrazione</span>
                    </div>
                </div>

                <h2 class="section-title">Descrizione azienda</h2>
                <div class="job-description">
                    Lantech Longwave, società del Gruppo Zucchetti, prima software house in Europa con più di 8000 addetti, si occupa 
                    della progettazione e dell'implementazione di soluzioni e servizi tecnologici innovativi, sicuri e performanti negli ambiti 
                    Security, Networking, Datacenter & Cloud, Collaboration & AVI e Sviluppo Software.
                </div>

                <div class="company-location">
                    È presente in tredici sedi dislocate in nove città italiane e una in Svizzera: Reggio Emilia, Bologna, Padova, Verona, Milano, 
                    Besana Brianza, Roma, Modena, Parma e Chiasso.
                </div>

                <div class="job-description">
                    Il Team di oltre 300 collaboratori opera con l'obiettivo di rendere la tecnologia alla portata di tutti. Ogni soluzione ICT 
                    viene pensata e progettata partendo dalle persone e, attraverso uno studio di fattibilità, viene definita la 
                    tecnologia più adeguata alla specifica esigenza, in termini di performance, affidabilità e sicurezza.
                </div>

                <div class="job-description">
                    Ha ingegnerizzato una suite di servizi gestiti - LION® - erogati h24 7*7 per garantire un monitoraggio real-time e una 
                    gestione continua in massima sicurezza dell'intera infrastruttura ICT delle aziende.
                    <br><br>
                    <a href="http://www.lantechlongwave.it" class="website-link">www.lantechlongwave.it</a>
                </div>

                <div class="job-position">
                    <h2 class="section-title">Posizione</h2>
                    <div class="job-description">
                        Il/La candidato/a, che risponderà alla Direzione aziendale sarà inserito/a nell'organizzazione per gestire e monitorare i 
                        budget aziendali occupandosi del monitoraggio e analisi delle performance...
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="scroll-wrapper-classifica">
                <h2 class="ranking-title">Classifica</h2>
                <div class="ranking-list">
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">1°</span>
                            <span class="medal-icon">🏆</span>
                            <span class="candidate-name">Anterio Lavanda</span>
                        </div>
                        <span class="candidate-score">10/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">2°</span>
                            <span class="medal-icon">🥈</span>
                            <span class="candidate-name">Nevrei Ettern</span>
                        </div>
                        <span class="candidate-score">10/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">3°</span>
                            <span class="medal-icon">🥉</span>
                            <span class="candidate-name">Helmut Neik</span>
                        </div>
                        <span class="candidate-score">9/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">4°</span>
                            <span class="candidate-name">Eulero Ottomano</span>
                        </div>
                        <span class="candidate-score">8/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">5°</span>
                            <span class="candidate-name">Fabrizio Verna</span>
                        </div>
                        <span class="candidate-score">7/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">6°</span>
                            <span class="candidate-name">Sofia Galliani</span>
                        </div>
                        <span class="candidate-score">6/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">7°</span>
                            <span class="candidate-name">Leonardo Brasi</span>
                        </div>
                        <span class="candidate-score">6/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">8°</span>
                            <span class="candidate-name">Giulia Marani</span>
                        </div>
                        <span class="candidate-score">5/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">9°</span>
                            <span class="candidate-name">Tommaso Ricci</span>
                        </div>
                        <span class="candidate-score">5/10</span>
                    </div>
        
                    <div class="ranking-item">
                        <div class="candidate-info">
                            <span class="rank-number">10°</span>
                            <span class="candidate-name">Martina Gallo</span>
                        </div>
                        <span class="candidate-score">4/10</span>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
		<%@ include file="footer.jsp"%>
</body>
</html>