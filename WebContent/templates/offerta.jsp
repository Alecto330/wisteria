<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offerta di Lavoro - Sviluppatore Full Stack</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    <!-- Bootstrap per gli elementi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font-Awesome per le icone -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="../static/style_offerta.css">
    <link rel="stylesheet" href="../static/style_nav.css">
    <link rel="stylesheet" href="../static/style.css">
</head>



<body>
	<%@ include file="header.jsp"%>

   <div class="offerta-container">
        <!-- Pulsante Indietro stilizzato e centrato -->
       
        <div class="offer-card container-custom mt-5">
            <h1>Sviluppatore Full Stack</h1>
            <div class="row mb-3">
                <div class="col-sm-8">
                    <p><strong><i class="fas fa-industry"></i> LANTECH LONGWAVE SPA</strong></p>
                    <p><i class="fas fa-map-marker-alt"></i> Modena - Italia</p>
                    <p><i class="fas fa-briefcase"></i> Amministrazione</p>
                </div>
                <div class="col-sm-4 text-end">
                    <button class="btn btn-apply">Candidati per questo annuncio</button>
                </div>
            </div>

            <hr>

            <div class="details-section">
                <h5>Descrizione azienda</h5>
                <p>Lantech Longwave, società del Gruppo Zucchetti, prima software house in Europa con più di 8000 addetti...</p>

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
            </div>
        </div>
        <div class="btn-container">
		<button class="btn btn-back" onclick="history.back()">← Torna
			Indietro</button>
	</div>

    </div>
    
    
    
    <!--<body>

    <div class="offerta-container">

       
        <div class="offer-card container-custom mt-5">
            <h1>${job.titolo}</h1> 
            <div class="row mb-3">
                <div class="col-sm-8">
                    <p><strong><i class="fas fa-industry"></i> ${job.azienda}</strong></p> 
                    <p><i class="fas fa-map-marker-alt"></i> ${job.localita} - ${job.pais}</p>
                    <p><i class="fas fa-briefcase"></i> ${job.settore}</p>
                </div>
                <div class="col-sm-4 text-end">
                    <button class="btn btn-apply">Candidati per questo annuncio</button>
                </div>
            </div>

            <hr>

            <div class="details-section">
                <h5>Descrizione azienda</h5>
                <p>${job.descrizioneAzienda}</p> 

                <h5>Posizione</h5>
                <p>${job.posizione}</p>
                <h5>La risorsa si occuperà delle seguenti attività:</h5>
                <ul>
                    <li>${job.attivita1}</li>
                    <li>${job.attivita2}</li>
                    <li>${job.attivita3}</li>
                    <li>${job.attivita4}</li>
                    <li>${job.attivita5}</li>
                </ul>
            </div>
        </div>
        
        <div class="btn-container">
            <button class="btn btn-back" onclick="history.back()">← Torna Indietro</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>-->
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp"%>
</body>
</html>