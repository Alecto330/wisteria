<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-branding">
            <div class="footer-logo-container">
                <img src="${pageContext.request.contextPath}/assets/WISTERIA - NO SFONDO.png" alt="Logo Wisteria" class="footer-logo">
            </div>
            <p class="footer-description">La nostra azienda si dedica a offrire soluzioni tecnologiche innovative per supportare la crescita del tuo business.</p>
            <div class="footer-social">
                <a href="https://www.facebook.com/Wisteria" class="social-link" aria-label="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://www.x.com/Wisteria" class="social-link" aria-label="X">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter-x" viewBox="0 0 16 16">
                        <path d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z"/>
                    </svg>
                </a>
                <a href="https://www.linkedin.com/company/Wisteria" class="social-link" aria-label="LinkedIn">
                    <i class="fab fa-linkedin-in"></i>
                </a>
            </div>
        </div>
        <div class="footer-links">
            <div class="footer-column">
                <h3 class="footer-heading">Link Utili</h3>
                <ul class="footer-list">
                    <li><a href="${pageContext.request.contextPath}/about">Chi Siamo</a></li>
                    <li><a href="/servizi">Servizi</a></li>
                    <li><a href="${pageContext.request.contextPath}/home">Lavora con noi</a></li>
                    <li><a href="https://wisteri.blogspot.com">Blog</a></li>
                    <li><a href="/contatti">Contatti</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-heading">Contatti</h3>
                <ul class="footer-list contact-list">
                    <li>
                        <i class="fas fa-envelope"></i>
                        <a href="mailto:info@wisteria.com">info@wisteria.com</a>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <a href="tel:+391234567890">+39 123 456 7890</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="footer-bottom-content">
            <p class="copyright">&copy; 2024 Wisteria S.p.A. - Tutti i diritti riservati.</p>
            <div class="footer-bottom-links">
                <a href="${pageContext.request.contextPath}/templates/privacypolicy.jsp">Privacy Policy</a>
                <span class="separator">|</span>
                <a href="${pageContext.request.contextPath}/templates/terminicondizioni.jsp">Termini e Condizioni</a>
            </div>
        </div>
    </div>
</footer>