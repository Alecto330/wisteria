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

@WebServlet("/about")
public class about extends HttpServlet{
	
	public about() {
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");
		
		String header="";
		if(user==null) {
			header="header.jsp";
		}else {
			header=user.getHeader();
		}
		
		request.setAttribute("title", "About - Wisteria");
		request.setAttribute("content", "about.jsp");
		System.out.println(header);
		request.setAttribute("headerPath", header);
		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
		dispatcher.forward(request, response);
		
		//response.sendRedirect("templates/about.jsp");
	}

}
