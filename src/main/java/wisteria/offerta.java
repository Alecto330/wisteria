package wisteria;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cv.EsperienzaDAO;
import posizione.Posizione;
import posizione.PosizioneDAO;
import user.User;

@WebServlet("/offerta")
public class offerta extends HttpServlet{

	public offerta() {
	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");

		if(id != null) {

			PosizioneDAO dao=new PosizioneDAO();
			Posizione posizione=dao.getPosizione(id);

			request.setAttribute("posizione", posizione);

			HttpSession session = request.getSession();
			User user=(User)session.getAttribute("user");

			String header="";
			String offerta="";
			if(user==null) {
				header="header.jsp";
				offerta="offerta.jsp";
				request.setAttribute("candidates", null);
			}else {
				header=user.getHeader();
				offerta=user.getOfferta();

				int tot=dao.getTotaleDoamndeFromPosizione(Integer.parseInt(id));
				request.setAttribute("tot", tot);
				request.setAttribute("candidates", user.getCandidatiFromPosizione(posizione.getId()));
			}

			request.setAttribute("title", posizione.getTitolo());
			request.setAttribute("content", offerta);
			request.setAttribute("headerPath", header);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}		
	}
	
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String body = new BufferedReader(request.getReader())
				.lines()
				.collect(Collectors.joining("\n"));

		// Analizzare i parametri dal corpo della richiesta
		String esperienzaId = null;
		for (String param : body.split("&")) {
			String[] keyValue = param.split("=");
			if ("posizioneID".equals(keyValue[0])) {
				esperienzaId = keyValue.length > 1 ? keyValue[1] : null;
				break;
			}
		}
		if(esperienzaId!=null) {
			PosizioneDAO dao=new PosizioneDAO();
			dao.deletePosizione(Integer.parseInt(esperienzaId));
			
			response.sendRedirect("home");
		}
	
    }
}