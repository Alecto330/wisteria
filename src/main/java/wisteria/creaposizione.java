package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
				HashMap<Integer, Domanda> domandeMap= daoDomande.getDomandeFromIds(selectedQuestions);
				ArrayList<Domanda> domande=new  ArrayList<Domanda>(domandeMap.values());
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
        String regione = request.getParameter("regione");
        String provincia = request.getParameter("provincia-input");
        String settore = request.getParameter("settore");
        
        System.out.println(titolo);
        System.out.println(descrizione);
        System.out.println(regione);
        System.out.println(provincia);
        System.out.println(settore);

        /*Posizione posizione = new Posizione(0, titolo, descrizione, settore, provincia, regione);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        PosizioneDAO dao=new PosizioneDAO();
        dao.insertPosizione(posizione, user.getUsername());*/
        
        

        //response.sendRedirect("successoCreazione.jsp");
	}
	
	/*@Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera l'ID della posizione dai parametri della richiesta
        String posizioneId = request.getParameter("posizioneId");
 
        if (posizioneId != null) {
            try {
                // Istanzia il DAO per gestire le operazioni sul database
                PosizioneDAO dao = new PosizioneDAO();
               
                // Elimina la posizione dal database
                dao.deletePosizione(Integer.parseInt(posizioneId));
 
                // Imposta lo stato della risposta a 200 (successo)
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                // Se l'ID non è valido, restituisce un errore 400 (Bad Request)
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            } catch (Exception e) {
                // In caso di errore generico, restituisce un errore 500 (Internal Server Error)
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            // Se l'ID non è stato fornito, restituisce un errore 400 (Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }*/
}
