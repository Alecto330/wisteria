<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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

			<div class="hamburger" id="hamburger"><div class="bmenu">&#9776;</div></div>

			<nav class="menu" id="menu">
				<ul style="margin-top:1vw; height:87%; display: flex; flex-direction: column;">
					<li onclick="window.location.href='${pageContext.request.contextPath}/home'">
						<a><i class="fas fa-home"></i> Home</a>
					</li>
					<li onclick="window.location.href='${pageContext.request.contextPath}/profilepage'">
						<a><i class="fas fa-user"></i> Profilo</a>
					</li>
					<li onclick="window.location.href='${pageContext.request.contextPath}/about'">
						<a><i class="fa-solid fa-question"></i> About</a>
					</li>
					<li onclick="window.location.href='${pageContext.request.contextPath}/servizi'">
						<a><i class="fas fa-tools"></i> Services</a>
					</li>
					<li onclick="scrollToBottom()"><a><i
							class="fas fa-envelope"></i> Contact</a></li>
					<c:if test="${not empty user}">
						<li style="margin-top: auto; border: none;"><a href="${pageContext.request.contextPath}/logout" style="color: red;"><i class="fas fa-right-from-bracket"></i> Logout</a></li>
					</c:if>
				</ul>
			</nav>
			<div class="scroll-line"></div>
			<script>
                const hamburger = document.getElementById("hamburger");
                const menu = document.getElementById("menu");
            
                hamburger.addEventListener("click", () => {
                    if (menu.classList.contains("slide-in")) {
                        // menu aperto
                        menu.classList.remove("slide-in");
                        menu.classList.add("slide-out");
                    } else {
                        // menu chiuso
                        menu.classList.remove("slide-out");
                        menu.classList.add("slide-in");
                    }
                });
            </script>
			<a href="${pageContext.request.contextPath}/home"
				class="logo-container"> <span> <img
					src="${pageContext.request.contextPath}/assets/WISTERIA - NO SFONDO2.png"
					alt="Logo Wisteria" class="logo-img">
			</span>
			</a>

			<c:choose>
				
				<c:when test="${pageContext.request.servletPath == '/templates/login.jsp'}"> 
					<div class="acc">
						<span class="hidden" style="color:white !important;"><p>Accedi</p></span>
					</div>
					
				</c:when>
				<c:otherwise>

					<c:if test="${not empty user}">
						<div class="logout">
						<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<div class="acc2"><i class="fa-solid fa-user usernav"></i></div>
						</a>
						<a id="profile-alert" class="profile-alert" href="${pageContext.request.contextPath}/profilepage">Completa il profilo</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/profilepage">Profilo</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
						</div>
						</div>
					</c:if>
					
					<c:if test="${empty user}"> <!-- utente non autenticato -->
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
            menu.classList.toggle('show');
        });

		function scrollToBottom() {
            window.scrollTo({
                top: document.body.scrollHeight,
                behavior: "smooth"
            });
			menu.classList.remove("slide-in");
			menu.classList.add("slide-out");
		}
		document.addEventListener("click", function (event) {
		    const menu = document.getElementById("menu");
		    const hamburger = document.getElementById("hamburger");

		    if (!menu.contains(event.target) && !hamburger.contains(event.target)) {
		        if (menu.classList.contains("slide-in")) {
		            menu.classList.remove("slide-in");
		            menu.classList.add("slide-out");
		        }
		    }
		});

		window.addEventListener("scroll", function () {
			const scrollLine = document.querySelector(".scroll-line");
			const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
			const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
			const scrollPercentage = (scrollTop / scrollHeight) * 100;
			scrollLine.style.width = scrollPercentage + "%";
		});

		
		document.addEventListener('DOMContentLoaded', () => {
			var isProfileComplete = ${user.isProfileComplete()}
			
			console.log(isProfileComplete);
			
			if (isProfileComplete==false && !window.location.pathname.endsWith("/profilepage")) {
				const alertElement = document.getElementById('profile-alert');
				alertElement.style.display = 'block';
			}
		});
</script>

