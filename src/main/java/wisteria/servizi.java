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

@WebServlet("/servizi")
public class servizi extends HttpServlet{
	
	public servizi(){
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		request.setAttribute("title", "Wisteria - Servizi");
		request.setAttribute("content", "servizi.jsp");
		if(user!=null) {
			request.setAttribute("headerPath", user.getHeader());
		}else {
			request.setAttribute("headerPath", "header.jsp");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
		dispatcher.forward(request, response);
	}

}
