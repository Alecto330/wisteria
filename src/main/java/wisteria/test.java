package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import domanda.Domanda;
import domanda.DomandaDAO;
import user.User;

@WebServlet("/test")
public class test extends HttpServlet {

	public test() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user==null || request.getParameter("idPosizione")==null || request.getParameter("nomePosizione")==null) {			
			response.sendRedirect("home");
		}else {
			String header=user.getHeader();
			
			String idPosizione=request.getParameter("idPosizione");
			String nomePosizione=request.getParameter("nomePosizione");
			
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
		}
	}

}
