package wisteria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import cv.CV;
import cv.CvDAO;
import user.User;
import user.UserDAO;

@WebServlet("/profilepage")
@MultipartConfig(maxRequestSize = 1024 * 1024 * 50)
public class profilepage extends HttpServlet{

	public profilepage() {

	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user != null) {
			redirectToPage(user, request, response);
		} else {
			response.sendRedirect("login");
		}
	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("Ciao");
		 // Ottieni il file PDF
		//InputStream fileContent = filePart.getInputStream();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String nome = request.getParameter("Nome");
		String cognome = request.getParameter("Cognome");
		String username = request.getParameter("Username");
		String dataDiNascita = request.getParameter("DataDiNascita");
		String email = request.getParameter("Email");
		String cf = request.getParameter("CF");
		String telefono = request.getParameter("Telefono");
		String titolo = request.getParameter("Titolo");
		
		Part cv = request.getPart("cv");
		
		UserDAO userDao=new UserDAO();
		CvDAO cvDao=new CvDAO();
		
		if(nome!=null) {
			cvDao.updateNome(user.getUsername(), nome);
			redirectToPage(user, request, response);
			System.out.println("Nome aggionato");
			return;
		}
		
		if(cognome!=null) {
			cvDao.updateCognome(user.getUsername(), cognome);
			redirectToPage(user, request, response);
			System.out.println("Cognome aggionato");
			return;
		}
		
		if(username!=null) {
			userDao.updateUsername(user.getUsername(), username);
		    
			user.setUsername(username);	  
		    session.setAttribute("user", user);
			
			redirectToPage(user, request, response);
			
		    System.out.println("Username aggionato");
			return;
		}
		
		if(dataDiNascita!=null) {
			cvDao.updateDataDiNascita(user.getUsername(), dataDiNascita);
			redirectToPage(user, request, response);
			System.out.println("Data di nascita aggionata");
			return;
		}
		
		if(email!=null) {
			userDao.updateEmail(user.getUsername(), email);
			
			user.setEmail(email);	  
		    session.setAttribute("user", user);
			
			redirectToPage(user, request, response);
			
			System.out.println("Email aggionata");
			return;
		}
		
		if(cf!=null) {
			cvDao.updateCf(user.getUsername(), cf);
			redirectToPage(user, request, response);
			System.out.println("Codice Fiscale aggionato");
			return;
		}
		
		if(telefono!=null) {
			cvDao.updateTelefono(user.getUsername(), telefono);
			redirectToPage(user, request, response);
			System.out.println("Telefono aggionato");
			return;
		}
		
		if(titolo!=null) {
			cvDao.updateTitolo(user.getUsername(), titolo);
			redirectToPage(user, request, response);
			System.out.println("Titolo aggionato");
			return;
		}
		
		if(cv!=null) {
			cvDao.updateCV(user.getUsername(), cv);
			redirectToPage(user, request, response);
			System.out.println("CV aggionato");
			return;
		}
		
	}
	
	public void redirectToPage(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CvDAO dao=new CvDAO();
		CV cv=dao.getCV(user.getUsername());
		request.setAttribute("username", user.getUsername());
		request.setAttribute("email", user.getEmail());
		request.setAttribute("cf", cv.getCf());
		request.setAttribute("nome", cv.getNome());
		request.setAttribute("cognome", cv.getCognome());
		request.setAttribute("dataDiNascita", cv.getDataDiNascita());
		request.setAttribute("residenza", cv.getResidenza());
		request.setAttribute("titoloDiStudio", cv.getTitoloDiStudio());
		request.setAttribute("curriculum", cv.getCurriculum());
		request.setAttribute("fotoProfilo", cv.getFotoProfilo());
		request.setAttribute("telefono", cv.getTelefono());

		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/profilepage.jsp");
		dispatcher.forward(request, response);
	}

	/*public static void main(String[] args) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="INSERT INTO cv (cf, nome, cognome, dataDiNascita, residenza, titoloDiStudio, curriculum, fotoProfilo, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, "cfffff");
			preparedStatement.setString(2, "nomeee");
			preparedStatement.setString(3, "cognomeee");
			preparedStatement.setDate(4, Date.valueOf("2024-11-08"));
			preparedStatement.setString(5, "residenzaaa");
			preparedStatement.setString(6, "titoloDiStudio");
			preparedStatement.setBytes(7, null);
			preparedStatement.setBytes(8, null);
			preparedStatement.setString(9, "telefonooo");
			preparedStatement.executeUpdate();

			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
