package wisteria;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import user.User;

@WebServlet("/creadomanda")
public class creadomanda extends HttpServlet{

	public creadomanda() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user!=null) {
			request.setAttribute("title", "Crea Domanda");
			request.setAttribute("content", "creadomanda.jsp");
			request.setAttribute("headerPath", user.getHeader());
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("home");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nomeDomanda=request.getParameter("question");
		String risposte=request.getParameter("answers");
		String[] risposteArray=risposte.split(",");

		
		
		System.out.println(nomeDomanda);
	}





}
