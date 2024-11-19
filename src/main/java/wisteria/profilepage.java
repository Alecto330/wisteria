package wisteria;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;

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
import cv.Esperienza;
import cv.EsperienzaDAO;
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
			if (cv.getCurriculum() != null) {
				String base64PDF = Base64.getEncoder().encodeToString(cv.getCurriculum());
				request.setAttribute("pdfData", base64PDF);
			}
			request.setAttribute("fotoProfilo", cv.getFotoProfilo());
			request.setAttribute("telefono", cv.getTelefono());
			
			EsperienzaDAO esperienzaDAO=new EsperienzaDAO();
			ArrayList<Esperienza> esperienze=esperienzaDAO.getEsperienzeFromCV(cv.getCf());
			
			request.setAttribute("esperienze", esperienze);

			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/profilepage.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("login");
		}
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//System.out.println("Ciao");

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

		UserDAO userDao=new UserDAO();
		CvDAO cvDao=new CvDAO();

		if(nome!=null) {
			cvDao.updateNome(user.getUsername(), nome);
			System.out.println("Nome aggionato");
			return;
		}

		if(cognome!=null) {
			cvDao.updateCognome(user.getUsername(), cognome);
			System.out.println("Cognome aggionato");
			return;
		}

		if(username!=null) {
			userDao.updateUsername(user.getUsername(), username);

			user.setUsername(username);	  
			session.setAttribute("user", user);
			System.out.println("Username aggionato");
			return;
		}

		if(dataDiNascita!=null) {
			cvDao.updateDataDiNascita(user.getUsername(), dataDiNascita);
			System.out.println("Data di nascita aggionata");
			return;
		}

		if(email!=null) {
			userDao.updateEmail(user.getUsername(), email);

			user.setEmail(email);	  
			session.setAttribute("user", user);
			System.out.println("Email aggionata");
			return;
		}

		if(cf!=null) {
			cvDao.updateCf(user.getUsername(), cf);
			System.out.println("Codice Fiscale aggionato");
			return;
		}

		if(telefono!=null) {
			cvDao.updateTelefono(user.getUsername(), telefono);
			System.out.println("Telefono aggionato");
			return;
		}

		if(titolo!=null) {
			cvDao.updateTitolo(user.getUsername(), titolo);
			System.out.println("Titolo aggionato");
			return;
		}

		try {
			Part cv = request.getPart("cv");

			if (cv != null) {
				InputStream inputStream = null;
				try {
					long size=cv.getSize();
					inputStream = cv.getInputStream();
					cvDao.updateCV(user.getUsername(), inputStream, size);

					System.out.println("CV updated successfully.");
				} finally {

					if (inputStream != null) {
						inputStream.close();
					}

					try {
						cv.delete(); // Deletes the temporary file if no longer needed.
					} catch (IOException e) {
						System.err.println("Failed to delete temporary file: " + e.getMessage());
					}
				}
				return;
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}


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
