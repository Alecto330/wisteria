package wisteria;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domanda.Domanda;
import domanda.DomandaDAO;
import posizione.Posizione;
import posizione.PosizioneDAO;
import user.User;

@WebServlet("/creaposizione")
public class creaposizione extends HttpServlet {

	public creaposizione() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PosizioneDAO dao=new PosizioneDAO();        

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null || user.accediACreaPosizione() == false) {
			response.sendRedirect("home");
		} else {
			ArrayList<String> regionList = dao.getAllRegioni();
			ArrayList<String> provinceList = dao.getAllProvince();
			ArrayList<String> professionList = dao.getAllProfessioni();

			String[] selectedQuestions = request.getParameterValues("question");
			
			String titolo=request.getParameter("titolo");
			String descrizione=request.getParameter("descrizione");
			String provincia=request.getParameter("provincia");
			String settore=request.getParameter("settore");

			if(selectedQuestions!=null) {
				DomandaDAO daoDomande=new DomandaDAO();
				ArrayList<Domanda> domande=daoDomande.getDomandeFromIds(selectedQuestions);
				request.setAttribute("domande", domande);
			}
			
			request.setAttribute("titolo", titolo);
			request.setAttribute("descrizione", descrizione);
			request.setAttribute("provincia", provincia);
			request.setAttribute("settore", settore);

			request.setAttribute("regionList", regionList);
			request.setAttribute("provinceList", provinceList);
			request.setAttribute("professionList", professionList);
			request.setAttribute("title", "Crea Posizione");
			request.setAttribute("content", "creaposizione.jsp");
			request.setAttribute("headerPath", user.getHeader());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titolo = request.getParameter("titolo");
        String descrizione = request.getParameter("descrizione");
        String provincia = request.getParameter("provinciaupdateRegione");
        String settore = request.getParameter("settore");
        String[] domande = request.getParameterValues("domanda");

        Posizione posizione = new Posizione(0, titolo, descrizione, settore, provincia, "", "");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        PosizioneDAO dao=new PosizioneDAO();
        int posizioneId=dao.insertPosizione(posizione, user.getUsername());
        
        for(String domanda: domande) {
        	dao.insertDomandeForPosizione(Integer.parseInt(domanda), posizioneId);
        }
        
        response.sendRedirect("home");
	}
	
	@Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera l'ID della posizione dai parametri della richiesta
        
		
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
		
		
		
		
		
		
		
		
		
		
		/*String posizioneId = request.getParameter("posizioneId");
 
        if (posizioneId != null) {
                // Istanzia il DAO per gestire le operazioni sul database
                PosizioneDAO dao = new PosizioneDAO();
               
                // Elimina la posizione dal database
                //dao.deletePosizione(Integer.parseInt(posizioneId));
                System.out.println(posizioneId);
 
                // Imposta lo stato della risposta a 200 (successo)
                response.setStatus(HttpServletResponse.SC_OK);
        } else {
            // Se l'ID non è stato fornito, restituisce un errore 400 (Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }*/
    }
}
