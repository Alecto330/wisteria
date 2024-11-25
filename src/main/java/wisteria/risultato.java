package wisteria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.User;

@WebServlet("/risultato")
public class risultato extends HttpServlet {

	public risultato() {

	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");
		
		String risultato=request.getParameter("risultato");
		String ndomande=request.getParameter("ndomande");

		if(user==null || risultato==null || ndomande==null) {
			response.sendRedirect("home");
		}else {
			request.setAttribute("risultato", risultato);
			request.setAttribute("ndomande", ndomande);
			request.setAttribute("title", "Risultato Quiz");
			request.setAttribute("content", "risultato.jsp");
			request.setAttribute("headerPath", user.getHeader());
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}
	}
}
