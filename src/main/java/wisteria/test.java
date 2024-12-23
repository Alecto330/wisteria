package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import domanda.Domanda;
import domanda.DomandaDAO;
import posizione.CandidaturaDAO;
import user.User;

@WebServlet("/test")
public class test extends HttpServlet {

	public test() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user==null || request.getParameter("idPosizione")==null || request.getParameter("nomePosizione")==null || !user.eseguiTest()) {			
			response.sendRedirect("login");
		}else {
			String header=user.getHeader();

			String idPosizione=request.getParameter("idPosizione");
			String nomePosizione=request.getParameter("nomePosizione");

			CandidaturaDAO candidaturaDao=new CandidaturaDAO();
			boolean check=candidaturaDao.checkCandidatura(Integer.parseInt(idPosizione), user.getUsername());

			if(!check) {
				DomandaDAO dao=new DomandaDAO();
				HashMap<Integer, Domanda> domande=dao.getDomandeFromPosizione(Integer.parseInt(idPosizione));
				ArrayList<Domanda> domandeQuiz=new ArrayList<Domanda>(domande.values());

				request.setAttribute("domande", domandeQuiz);
				request.setAttribute("nomePosizione", nomePosizione);
				request.setAttribute("title", "Quiz");
				request.setAttribute("content", "testcandidato.jsp");
				request.setAttribute("headerPath", header);
				RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
				dispatcher.forward(request, response);
			}else {
				DomandaDAO domandaDAO=new DomandaDAO();
				int ndomande=domandaDAO.getNumeroDomande(Integer.parseInt(idPosizione));
				int risultato=candidaturaDao.getRisultato(Integer.parseInt(idPosizione), user.getUsername());

				response.sendRedirect("risultato?risultato="+risultato+"&ndomande="+ndomande);
			}

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DomandaDAO dao=new DomandaDAO();
		String idPosizione="";
		int result=0;
		Map<String, String[]> parameterMap = request.getParameterMap();	    

		for(Map.Entry<String, String[]> entry: parameterMap.entrySet()) {

			if(!entry.getKey().equals("idPosizione")) {
				boolean check=dao.checkRisposta(Integer.valueOf(entry.getKey()), Integer.valueOf(entry.getValue()[0]));

				if(check) {
					result++;
				}
			}else {
				idPosizione=entry.getValue()[0];
			}
		}

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		dao.insertSiCandida(Integer.parseInt(idPosizione), user.getUsername(), result);

		response.sendRedirect("risultato?risultato="+result+"&ndomande="+ (parameterMap.values().size() - 1));

	}


}
