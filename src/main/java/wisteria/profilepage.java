package wisteria;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.stream.Collectors;

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
			if (cv.getFotoProfilo() != null) {
		        String base64Image = Base64.getEncoder().encodeToString(cv.getFotoProfilo());
		        request.setAttribute("fotoProfiloData", base64Image);
		    }
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

		String titoloEsperienza = request.getParameter("titolo");
		String descrizioneEsperienza = request.getParameter("esperienza");
		
		

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

		if(titoloEsperienza!=null && descrizioneEsperienza!=null && !titoloEsperienza.trim().isEmpty() && !descrizioneEsperienza.trim().isEmpty()) {
			EsperienzaDAO dao=new EsperienzaDAO();
			String codiceFiscale=cvDao.getCf(user.getUsername());
			dao.insertEsperienza(titoloEsperienza, descrizioneEsperienza, codiceFiscale);
			response.sendRedirect("profilepage");
		}else {
			//TODO
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
		
		
		try {
			Part image = request.getPart("profileImage");
			if (image != null) {
		        InputStream imageInputStream = null;
		        try {
		            long imageSize = image.getSize();
		            imageInputStream = image.getInputStream();
		            cvDao.updateImage(user.getUsername(), imageInputStream, imageSize);  // Use DAO to save image

		            System.out.println("Immagine aggiornata correttamente.");
		        } finally {
		            if (imageInputStream != null) {
		                imageInputStream.close();
		            }

		            try {
		                image.delete(); // Deletes the temporary file if no longer needed.
		            } catch (IOException e) {
		                System.err.println("Errore durante la cancellazione del file temporaneo dell'immagine: " + e.getMessage());
		            }
		        }
		        return;
		    }
		} catch (Exception e) {
		    // Handle any error for image processing
		    System.err.println("Errore durante l'aggiornamento dell'immagine: " + e.getMessage());
		}
		
		//TODO aggiungere aggiornamento profilePage qui
		

	}


	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		String body = new BufferedReader(request.getReader())
				.lines()
				.collect(Collectors.joining("\n"));

		// Analizzare i parametri dal corpo della richiesta
		String esperienzaId = null;
		for (String param : body.split("&")) {
			String[] keyValue = param.split("=");
			if ("esperienzaId".equals(keyValue[0])) {
				esperienzaId = keyValue.length > 1 ? keyValue[1] : null;
				break;
			}
		}
		
		if(esperienzaId!=null) {
			EsperienzaDAO dao=new EsperienzaDAO();
			dao.deleteEsperienza(Integer.parseInt(esperienzaId));
			response.setStatus(HttpServletResponse.SC_OK);
		}
	}
}
