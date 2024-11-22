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
                <ul style="margin-top:1vw; height:87%; display: flex; flex-direction: column; justify-content: space-between;">
                    <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/creaposizione"><i class="fas fa-plus"></i> Crea Posizione</a></li>
                    <c:if test="${not empty user}">
                    	<li style="margin-top: auto; border: none;"><a href="${pageContext.request.contextPath}/logout" style="color: red;"><i class="fas fa-person"></i> Logout</a></li>
                	</c:if>
                </ul>
            </nav>
            <div class="scroll-line"></div>

            <a href="${pageContext.request.contextPath}/home" class="logo-container">
                <span>
                    <img src="${pageContext.request.contextPath}/assets/WISTERIA - NO SFONDO.png" alt="Logo Wisteria" class="logo-img">
                </span>
            </a>

            <div class="logout">
                <a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="acc2"> </div>
                </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </div>

        </nav>
    </section>
</header>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const hamburger = document.getElementById("hamburger");
        const menu = document.getElementById("menu");

        // Funzione per aprire il menu
        function openMenu() {
            menu.classList.add("slide-in");
            menu.classList.remove("slide-out");
            document.body.classList.add("no-scroll"); // Opzionale: impedisce lo scroll dello sfondo
        }

        // Funzione per chiudere il menu
        function closeMenu() {
            menu.classList.remove("slide-in");
            menu.classList.add("slide-out");
            document.body.classList.remove("no-scroll"); // Opzionale
        }

        // Toggle del menu al click sull'hamburger
        hamburger.addEventListener("click", function (e) {
            e.stopPropagation(); // Previene che il click si propaghi al documento
            if (menu.classList.contains("slide-in")) {
                closeMenu();
            } else {
                openMenu();
            }
        });

        // Chiudi il menu se si clicca fuori di esso
        document.addEventListener("click", function (e) {
            const isClickInsideMenu = menu.contains(e.target);
            const isClickOnHamburger = hamburger.contains(e.target);

            if (!isClickInsideMenu && !isClickOnHamburger && menu.classList.contains("slide-in")) {
                closeMenu();
            }
        });

        // Chiudi il menu quando si clicca su un link del menu
        const menuLinks = menu.querySelectorAll("a");
        menuLinks.forEach(function (link) {
            link.addEventListener("click", function () {
                closeMenu();
            });
        });

        // Chiudi il menu quando si preme il tasto Esc
        document.addEventListener("keydown", function (e) {
            if (e.key === "Escape" && menu.classList.contains("slide-in")) {
                closeMenu();
            }
        });

        // Funzione per la barra di scorrimento
        window.addEventListener("scroll", function () {
            const scrollLine = document.querySelector(".scroll-line");
            const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrollPercentage = (scrollTop / scrollHeight) * 100;
            scrollLine.style.width = scrollPercentage + "%";
        });
    });
</script>
