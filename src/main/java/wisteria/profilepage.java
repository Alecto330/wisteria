package wisteria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import cv.CV;
import cv.CvDAO;
import user.User;

@WebServlet("/profilepage")
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
			request.setAttribute("curriculum", cv.getCurriculum());
			request.setAttribute("fotoProfilo", cv.getFotoProfilo());
			request.setAttribute("telefono", cv.getTelefono());

			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/profilepage.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("login");
		}



	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("Ciao");
		//Part filePart = request.getPart("pdf"); // Ottieni il file PDF
		//InputStream fileContent = filePart.getInputStream();
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
