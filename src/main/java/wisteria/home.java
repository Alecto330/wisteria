package wisteria;

import java.io.IOException;
import java.util.ArrayList;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PosizioneDAO dao=new PosizioneDAO();

		ArrayList<String> professionList=dao.getAllProfessioni();
		ArrayList<String> regionList=dao.getAllRegioni();
		ArrayList<Posizione> jobOffers=null;
		String profession = request.getParameter("profession");
		String region = request.getParameter("region");
		String search = request.getParameter("search");

		if(profession!=null || region!=null || search !=null) {
			jobOffers=dao.getFilteredPosizioni(search, region, profession);
			request.setAttribute("profession", profession);
			request.setAttribute("region", region);
			request.setAttribute("search", search);
		}else {
			jobOffers=dao.getAllPosizioni();
		}

		request.setAttribute("jobOffers", jobOffers);
		request.setAttribute("professionList", professionList);
		request.setAttribute("regionList", regionList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/home.jsp");
		dispatcher.forward(request, response);
	}
}