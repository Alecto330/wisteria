<!-- header.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style_nav.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Font Awesome CDN -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<header>
	<section>
		<!--############################ BARRA DI NAVIGAZIONE ####################################-->

		<nav class="navbar custom-navbar justify-content-between fixed-top">

			<!--<c:choose>
				<c:when
					test="${pageContext.request.servletPath == '/templates/login.jsp'}">
					<link rel="stylesheet"
						href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
					<div class="hamburger" id="hamburger">
						<i class="fas fa-arrow-left"></i>
					</div>
				</c:when>
				<c:otherwise>
					<div class="hamburger" id="hamburger">
						&#9776;
					</div>
				</c:otherwise>
			</c:choose> -->

			<div class="hamburger" id="hamburger">&#9776;</div>


			<nav class="menu" id="menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/home"><i
							class="fas fa-home"></i> Home</a></li>
					<li><a href="${pageContext.request.contextPath}/creadomanda"><i
							class="fas fa-plus"></i> Crea Domande</a></li>
					<li><a href="${pageContext.request.contextPath}/creaposizione"><i
						class="fas fa-plus"></i> Crea Posizione</a></li>
					<li><a href="${pageContext.request.contextPath}/visualizzacandidato"><i
						class="fa-solid fa-magnifying-glass"></i> Cerca candidati</a></li>
					<li><a href="${pageContext.request.contextPath}/about"><i
							class="fa-solid fa-question"></i> About</a></li>
					<li><a onclick="scrollToBottom()" style="cursor: pointer"><i
							class="fas fa-envelope"></i> Contact</a></li>
				</ul>
			</nav>
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
			<!--<a class="btn btn-primary" href="${pageContext.request.contextPath}/login"> Accedi </a>-->

				
			<div class="dropdown">
				<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa-solid fa-user" style="font-size: 3vh; width: 3vw;"></i>
				</a>
			
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
				</div>
			</div>




			<!--
	  <c:choose>
        <c:when test="${not empty user}">

            <div class="user-info">

                <p>Hello, ${user.username}!</p>
            </div>
        </c:when>
        <c:otherwise>
         
            <p>Hello, Guest! <a href="login.jsp">Log in</a> to see more features.</p>
        </c:otherwise>
    </c:choose>-->

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

