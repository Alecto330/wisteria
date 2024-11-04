package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map.Entry;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import posizione.Posizione;
import posizione.PosizioneDAO;

@WebServlet("/home")
public class home extends HttpServlet { 
 
	public home() {
	}
 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PosizioneDAO dao=new PosizioneDAO();
		HashMap<Integer, Posizione> posizioni=dao.getAllPosizioni();
		ArrayList<Posizione> jobOffers= new ArrayList<>(posizioni.values());
		
		/*for(Entry<Integer, Posizione> posizione: posizioni.entrySet()) {
			
			System.out.println(posizione.getValue().getTitolo());
			
		}*/
		
		/*ArrayList<Posizione> jobOffers = new ArrayList<>();
		
		Posizione posizione1=new Posizione(0, "ciao1", "ciao!!!", "ciaooooooooooooooooooooooooo", "cia");
		Posizione posizione2=new Posizione(0, "ciao2", "ciao!!!", "ciaooooooooooooooooooooooooo", "cia");
		Posizione posizione3=new Posizione(0, "ciao3", "ciao!!!", "ciaooooooooooooooooooooooooo", "cia");
		Posizione posizione4=new Posizione(0, "ciao4", "ciao!!!", "ciaooooooooooooooooooooooooo", "cia");
		
		jobOffers.add(posizione1);
		jobOffers.add(posizione2);
		jobOffers.add(posizione3);
		jobOffers.add(posizione4);
		jobOffers.add(posizione1);
		jobOffers.add(posizione2);
		jobOffers.add(posizione3);
		jobOffers.add(posizione4);
		jobOffers.add(posizione1);
		jobOffers.add(posizione2);
		jobOffers.add(posizione3);
		jobOffers.add(posizione4);*/
		
	    request.setAttribute("jobOffers", jobOffers);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("templates/home.jsp");
	    dispatcher.forward(request, response); 
	}
}
 
 