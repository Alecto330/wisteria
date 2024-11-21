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

@WebServlet("/creadomanda")
public class creadomanda extends HttpServlet{
	
	public creadomanda() {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		/*request.setAttribute("title", "Crea Domanda");
		request.setAttribute("content", "about.jsp");
		request.setAttribute("headerPath", header);
		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
		dispatcher.forward(request, response);*/
		
		response.sendRedirect("templates/creadomanda.jsp");
	}
	
	
	

}
