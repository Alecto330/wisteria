package wisteria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
				request.setAttribute("candidates", user.getCandidatiFromPosizione(posizione.getId()));
			}

			request.setAttribute("title", posizione.getTitolo());
			request.setAttribute("content", offerta);
			request.setAttribute("headerPath", header);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}		
	}
}