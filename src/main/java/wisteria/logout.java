package wisteria;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet{
	
	
	public logout() {
		
	}
	
	
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the current session, if it exists
	        HttpSession session = request.getSession(false);
	        
	        // If the session exists, invalidate it to log the user out
	        if (session != null) {
	            session.invalidate();
	        }
	        
	        // Redirect the user to the login page (or homepage)
	        response.sendRedirect("home"); // Replace "login.jsp" with the desired page
	    }

}
