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
import user.UserDAO;

@WebServlet("/login")
public class login extends HttpServlet {

	public login() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/login.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("home");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		System.out.println(email);
		String password = request.getParameter("password");
		System.out.println(password);

		UserDAO dao=new UserDAO();
		User user=dao.login(email, password);

		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(30 * 60); // Set session timeout (optional)

			response.sendRedirect("home");
		}else {
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("error", "Credenziali Errate");
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/login.jsp");
			dispatcher.forward(request, response);		
		}
	}
}