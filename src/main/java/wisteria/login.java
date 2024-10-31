package wisteria;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.User;
import user.UserDAO;
import utils.DatabaseConnection;
 
 
@WebServlet("/login")
public class login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
 
	public login() {
	}
 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
 
		response.sendRedirect("index.html");
 
	}
 
 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DatabaseConnection databaseConnection=new DatabaseConnection();
 
		String email = request.getParameter("email");
		System.out.println(email);
		String password = request.getParameter("password");
		System.out.println(password);
 
		/*UserDAO dao=new UserDAO();
		User user=dao.login(email, password);*/
		
		response.setContentType("text/plain");
		// Imposta il codice di stato della risposta
		response.setStatus(HttpServletResponse.SC_OK);
 
		// Scrive una risposta testuale semplice
		PrintWriter out = response.getWriter();
		out.println("Risposta ricevuta con successo!");
		out.close();
	}
}
 
 