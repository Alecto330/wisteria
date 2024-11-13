package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import posizione.Posizione;
import posizione.PosizioneDAO;
import user.User;

@WebServlet("/creaposizione")
public class creaposizione extends HttpServlet{

	public creaposizione() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user==null || user.accediACreaPosizione()==false) {
			response.sendRedirect("home");
		}else {
			PosizioneDAO dao=new PosizioneDAO();
			ArrayList<String> regionList=dao.getAllRegioni();
			ArrayList<String> provinceList=dao.getAllProvince();
			ArrayList<String> professionList=dao.getAllProfessioni();

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

		String titolo=request.getParameter("titolo");
		String descrizione=request.getParameter("descrizione");
		String regione=request.getParameter("regione");
		String provincia=request.getParameter("provincia");
		String professione=request.getParameter("professione");

		Posizione posizione=new Posizione(0, titolo, descrizione, professione, provincia, regione);

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		/*PosizioneDAO dao=new PosizioneDAO();
		dao.insertPosizione(posizione, user.getUsername());*/

	}


}
