package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;

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
import posizione.CandidaturaDAO;
import posizione.PosizioneDAO;
import softskill.SoftSkill;
import softskill.SoftSkillDAO;
import user.User;

@WebServlet("/visualizzacandidato")
public class visualizzacandidato extends HttpServlet{

	public visualizzacandidato() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");

		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");

		if(user!=null && user.visualizzaCandidato()) {

			if(id != null) {
				CvDAO dao=new CvDAO();
				CV cv=null;
				try {
					cv = dao.getCV(id);
				} catch (Exception e) {
					e.printStackTrace();
				}

				EsperienzaDAO esperienzaDAO=new EsperienzaDAO();
				ArrayList<Esperienza> esperienze=esperienzaDAO.getEsperienzeFromCV(cv.getCf());

				SoftSkillDAO skillDao=new SoftSkillDAO();
				SoftSkill skill=skillDao.getSoftSkills(id);


				String header=user.getHeader();

				request.setAttribute("title", "Profilo Utente - "+id);//TODO
				request.setAttribute("content", "visualizzacandidato.jsp");
				request.setAttribute("headerPath", header);

				request.setAttribute("username", id);
				request.setAttribute("nome", cv.getNome());
				request.setAttribute("cognome", cv.getCognome());
				request.setAttribute("email", cv.getEmail());
				request.setAttribute("cf", cv.getCf());
				request.setAttribute("nome", cv.getNome());
				request.setAttribute("cognome", cv.getCognome());
				request.setAttribute("dataDiNascita", cv.getDataDiNascita());
				request.setAttribute("residenza", cv.getResidenza());
				request.setAttribute("titoloDiStudio", cv.getTitoloDiStudio());
				if (cv.getCurriculum() != null) {
					String base64PDF = Base64.getEncoder().encodeToString(cv.getCurriculum());
					request.setAttribute("pdfData", base64PDF);
				}
				if (cv.getFotoProfilo() != null) {
					String base64Image = Base64.getEncoder().encodeToString(cv.getFotoProfilo());
					request.setAttribute("fotoProfiloData", base64Image);
				}
				request.setAttribute("telefono", cv.getTelefono());
				request.setAttribute("esperienze", esperienze);
				request.setAttribute("skill", skill);

				RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String posizioneId=request.getParameter("idPosizione");

		PosizioneDAO posizioneDAO=new PosizioneDAO();
		posizioneDAO.chiudiPosizione(Integer.parseInt(posizioneId), username);

		CandidaturaDAO candidaturaDAO=new CandidaturaDAO();
		candidaturaDAO.deleteSiCandida(Integer.parseInt(posizioneId));

		response.sendRedirect("home");

	}


}
