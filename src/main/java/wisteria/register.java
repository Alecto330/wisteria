package wisteria;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

@WebServlet("/register")
public class register extends HttpServlet{
	
	public register() {

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("templates/register.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		LocalDate dataNascita = Date.valueOf(request.getParameter("dataNascita")).toLocalDate();
		String codiceFiscale = request.getParameter("codiceFiscale");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		String error=check(nome, cognome, username, password, confirmPassword, email, codiceFiscale, dataNascita);
		if(error==null) {
			UserDAO dao=new UserDAO();
			dao.insertUser(nome, cognome, username, password, email, codiceFiscale, dataNascita);
			response.sendRedirect("login");
		}else {
			request.setAttribute("nome", nome);
			request.setAttribute("cognome", cognome);
			request.setAttribute("dataNascita", dataNascita.toString());
			request.setAttribute("codiceFiscale", codiceFiscale);
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("confirmPassword", confirmPassword);
			request.setAttribute("error", error);
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/register.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
	public String check(String nome, String cognome, String username, String password, String confirmPassword, String email, String codiceFiscale, LocalDate dateOfBirth) {
	    if (nome.isEmpty() || cognome.isEmpty() || username.isEmpty() || password.isEmpty() ||
	        confirmPassword.isEmpty() || email.isEmpty() || codiceFiscale.isEmpty() || dateOfBirth == null) {
	        //System.out.println("Errore: tutti i campi devono essere compilati.");
	        return "Errore: tutti i campi devono essere compilati.";
	    }

	    String regex = "^(?=.*[a-zA-Z])(?=.*\\d).{6,}$";
	    if (!Pattern.matches(regex, password)) {
	        //System.out.println("Errore: la password deve contenere almeno 6 caratteri, includendo lettere e numeri.");
	        return "Errore: la password deve contenere almeno 6 caratteri, includendo lettere e numeri.";
	    }

	    if (!password.equals(confirmPassword)) {
	        //System.out.println("Errore: le password non coincidono.");
	        return "Errore: le password non coincidono.";
	    }

	    LocalDate currentDate = LocalDate.now();
	    Period age = Period.between(dateOfBirth, currentDate);
	    if (age.getYears() < 16) {
	        //System.out.println("Errore: è necessario avere almeno 16 anni.");
	        return "Errore: è necessario avere almeno 16 anni.";
	    }
	    return null;
	}
}
