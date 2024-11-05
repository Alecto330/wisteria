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
		ArrayList<Posizione> jobOffers=dao.getAllPosizioni();

		
		/*ArrayList<Posizione> jobOffers = new ArrayList<>();
		
		Posizione posizione1=new Posizione(0, "ciao1", "ciaooooooooooooooooooooooooo", "ciao!!!", "cia", "ooo");
		Posizione posizione2=new Posizione(1, "ciao2", "ciaooooooooooooooooooooooooo", "ciao!!!", "cia", "ooo");
		Posizione posizione3=new Posizione(2, "ciao3", "ciaooooooooooooooooooooooooo", "ciao!!!", "cia", "ooo");
		Posizione posizione4=new Posizione(3, "ciao4", "ciaooooooooooooooooooooooooo", "ciao!!!", "cia", "ooo");
		
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
 
 