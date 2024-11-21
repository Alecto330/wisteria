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

@WebServlet("/listadomande")
public class listadomande extends HttpServlet{

	public listadomande() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user==null) {
			response.sendRedirect("home");
		}else {
			DomandaDAO dao=new DomandaDAO();
			HashMap<Integer, Domanda> domande=dao.getDomande();
			ArrayList<Domanda> questions=new  ArrayList<Domanda>(domande.values());
			request.setAttribute("questions", questions);
			
			request.setAttribute("title", "Lista Domande");
			request.setAttribute("content", "listadomande.jsp");
			request.setAttribute("headerPath", user.getHeader());

			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}
	}

}
