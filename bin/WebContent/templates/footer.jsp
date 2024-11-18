<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="footer">
    <div class="footer-content">
        <!-- Logo e Descrizione -->
        <div class="footer-branding">
            <div class="footer-logo-container">
                <img src="${pageContext.request.contextPath}/assets/WISTERIA - NO SFONDO.png" alt="Logo Wisteria" class="footer-logo">
            </div>
            <p class="footer-description">La nostra azienda si dedica a offrire soluzioni tecnologiche innovative per supportare la crescita del tuo business.</p>
            <div class="footer-social">
                <a href="https://www.facebook.com/Wisteria" class="social-link" aria-label="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://www.twitter.com/Wisteria" class="social-link" aria-label="Twitter">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="https://www.linkedin.com/company/Wisteria" class="social-link" aria-label="LinkedIn">
                    <i class="fab fa-linkedin-in"></i>
                </a>
            </div>
        </div>

        <!-- Links Section -->
        <div class="footer-links">
            <div class="footer-column">
                <h3 class="footer-heading">Link Utili</h3>
                <ul class="footer-list">
                    <li><a href="/chi-siamo">Chi Siamo</a></li>
                    <li><a href="/servizi">Servizi</a></li>
                    <li><a href="/carriere">Lavora con noi</a></li>
                    <li><a href="/blog">Blog</a></li>
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