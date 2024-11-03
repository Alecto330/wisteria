package wisteria;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
 
@WebServlet("/login")
public class login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
 
	public login() {
	}
 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

		//response.sendRedirect("index.html");
		response.sendRedirect("templates/login.jsp");
 
	}
 
 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		System.out.println(email);
		String password = request.getParameter("password");
		System.out.println(password);
		
		UserDAO dao=new UserDAO();
		dao.login(email, password);		
		
		response.sendRedirect("templates/home.jsp");
	}
}
 
 