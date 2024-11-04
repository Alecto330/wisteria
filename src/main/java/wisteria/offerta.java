package wisteria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import posizione.Posizione;
import posizione.PosizioneDAO;

@WebServlet("/offerta")
public class offerta extends HttpServlet{
	
	public offerta() {
	}
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("id");
		
		System.out.println(id);
		
		/*if(id != null) {
			
			PosizioneDAO dao=new PosizioneDAO();
			Posizione posizione=dao.getPosizione(id);
			
			request.setAttribute("posizione", posizione);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("templates/offerta.jsp");
		    dispatcher.forward(request, response); 
		}*/
		
		Posizione posizione1=new Posizione(Integer.parseInt(id), "ciao"+id, "ciaooooooooooooooooooooooooo", "ciao!!!", "cia", "ooo");
		
		request.setAttribute("posizione", posizione1);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("templates/offerta.jsp");
	    dispatcher.forward(request, response); 
	}

}
