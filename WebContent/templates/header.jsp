<!-- header.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Font Awesome CDN -->

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.ico" type="image/x-icon">
</head>

<header>
	<section>
		<!--############################ BARRA DI NAVIGAZIONE ####################################-->

		<nav class="navbar custom-navbar justify-content-between fixed-top">

			<div class="hamburger" id="hamburger">&#9776;</div>

			<nav class="menu" id="menu">
				<ul style="margin-top:1vw; height:87%; display: flex; flex-direction: column;">
					<li><a href="${pageContext.request.contextPath}/home"><i
							class="fas fa-home"></i> Home</a></li>
					<li><a href="${pageContext.request.contextPath}/profilepage"><i
							class="fas fa-user"></i> Profilo</a></li>
					<li><a href="${pageContext.request.contextPath}/about"><i
							class="fa-solid fa-question"></i> About</a></li>
					<li><a onclick="scrollToBottom() " class="contact"><i
							class="fas fa-envelope"></i> Contact</a></li>
					<c:if test="${not empty user}">
						<li style="margin-top: auto; border: none;"><a href="${pageContext.request.contextPath}/logout" style="color: red;"><i class="fas fa-person"></i> Logout</a></li>
					</c:if>
				</ul>
			</nav>
			<div class="scroll-line"></div>
			<script>
                const hamburger = document.getElementById("hamburger");
                const menu = document.getElementById("menu");
            
                hamburger.addEventListener("click", () => {
                    if (menu.classList.contains("slide-in")) {
                        // Se il menu è aperto, aggiunge la classe per lo slide-out
                        menu.classList.remove("slide-in");
                        menu.classList.add("slide-out");
                    } else {
                        // Se il menu è chiuso, lo apre
                        menu.classList.remove("slide-out");
                        menu.classList.add("slide-in");
                    }
                });
            </script>
			<a href="${pageContext.request.contextPath}/home"
				class="logo-container"> <span> <img
					src="${pageContext.request.contextPath}/assets/WISTERIA - NO SFONDO.png"
					alt="Logo Wisteria" class="logo-img">
			</span>
			</a>

			<c:choose>
				
				<c:when test="${pageContext.request.servletPath == '/templates/login.jsp'}"> <!-- Condizione: se siamo sulla pagina di login -->
					<div class="acc">
						<span class="hidden"><p>Accedi</p></span>
					</div>
					
				</c:when>
				<c:otherwise>

					<c:if test="${not empty user}">
						<!-- Se l'utente è autenticato, mostra l'icona -->
						<div class="logout">
							<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="acc2"><i class="fa-solid fa-user usernav"></i></div>
							</a>

							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/profilepage">Profilo</a>
							</div>
						</div>
					</c:if>
					
					<c:if test="${empty user}"> <!-- Se l'utente non è autenticato, mostra il link per il login -->
						<div class="acc">
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Accedi</a>
						</div>
					</c:if>
					
					
				</c:otherwise>
			</c:choose>

		</nav>
	</section>

</header>


<script> // ########################## FUNZIONI IN JAVASCRIPT ######################################
        document.getElementById('hamburger').addEventListener('click', function() {
            const menu = document.getElementById('menu');
            menu.classList.toggle('show'); // Toggle the 'show' class
        });

		function scrollToBottom() {
            window.scrollTo({
                top: document.body.scrollHeight,
                behavior: "smooth"
            });
			menu.classList.remove("slide-in");
			menu.classList.add("slide-out");
		}
    </script>
<!-- ########################## FINE FUNZIONI IN JAVASCRIPT ###############################-->

<script>
    window.addEventListener("scroll", function () {
        const scrollLine = document.querySelector(".scroll-line");
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        const scrollPercentage = (scrollTop / scrollHeight) * 100;
        scrollLine.style.width = scrollPercentage + "%"; // Aggiorna la larghezza della barra
    });
</script>

