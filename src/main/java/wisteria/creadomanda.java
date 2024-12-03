package wisteria;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import domanda.Domanda;
import domanda.DomandaDAO;
import user.User;

@WebServlet("/creadomanda")
public class creadomanda extends HttpServlet{

	public creadomanda() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user!=null) {
			request.setAttribute("title", "Crea Domanda");
			request.setAttribute("content", "creadomanda.jsp");
			request.setAttribute("headerPath", user.getHeader());
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("home");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nomeDomanda=request.getParameter("question");
		String risposte=request.getParameter("answers");
		String[] risposteArray=risposte.split(",");
		String corretta=request.getParameter("selectedAnswer");

		String titolo=request.getParameter("titolo");
		String provincia=request.getParameter("provincia");
		String descrizione=request.getParameter("descrizione");
		String settore=request.getParameter("settore");
		String domande=request.getParameter("domande");

		DomandaDAO domandaDAO = new DomandaDAO();
		Domanda newDomanda=domandaDAO.insertDomandaRisposte(nomeDomanda, risposteArray, Integer.parseInt(corretta));

		StringBuilder builder=new StringBuilder();
		if(!domande.isEmpty() || !domande.trim().isEmpty()) {
			String[] domandeArray=domande.split(",");
			for(String domandaId: domandeArray) {
				builder.append("&question="+domandaId);
			}
		}
		builder.append("&question="+newDomanda.getId());

		response.sendRedirect("creaposizione?titolo="+titolo+"&descrizione="+URLEncoder.encode(descrizione)+"&provincia="+provincia+"&settore="+settore+builder.toString());
	}

}
