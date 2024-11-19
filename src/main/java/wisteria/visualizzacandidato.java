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

import cv.CV;
import cv.CvDAO;
import cv.Esperienza;
import cv.EsperienzaDAO;
import user.User;

@WebServlet("/visualizzacandidato")
public class visualizzacandidato extends HttpServlet{

	public visualizzacandidato() {

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");

		if(id != null) {
			CvDAO dao=new CvDAO();
			CV cv=dao.getCV(id);
			
			EsperienzaDAO esperienzaDAO=new EsperienzaDAO();
			ArrayList<Esperienza> esperienze=esperienzaDAO.getEsperienzeFromCV(cv.getCf());

			HttpSession session = request.getSession();
			User user=(User)session.getAttribute("user");

			String header="";
			if(user==null) {
				header="header.jsp";
			}else {
				header=user.getHeader();
			}

			request.setAttribute("title", "Profilo Utente - "+id);//TODO
			request.setAttribute("content", "visualizzacandidato.jsp");
			request.setAttribute("headerPath", header);
			
			request.setAttribute("username", id);
			request.setAttribute("email", cv.getEmail());
			request.setAttribute("cf", cv.getCf());
			request.setAttribute("nome", cv.getNome());
			request.setAttribute("cognome", cv.getCognome());
			request.setAttribute("dataDiNascita", cv.getDataDiNascita());
			request.setAttribute("residenza", cv.getResidenza());
			request.setAttribute("titoloDiStudio", cv.getTitoloDiStudio());
			request.setAttribute("curriculum", cv.getCurriculum());
			request.setAttribute("fotoProfilo", cv.getFotoProfilo());
			request.setAttribute("telefono", cv.getTelefono());
			request.setAttribute("esperienze", esperienze);
			RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
			dispatcher.forward(request, response);
		}		
	}


}
