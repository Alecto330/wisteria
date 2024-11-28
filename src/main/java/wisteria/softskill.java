package wisteria;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import softskill.SoftSkillDAO;
import softskill.SoftSkillEnum;
import user.User;

@WebServlet("/softskill")
public class softskill extends HttpServlet{

	public softskill() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String username=request.getParameter("user");

		request.setAttribute("title", "Soft Skill Test");
		request.setAttribute("content", "softskill.jsp");
		request.setAttribute("headerPath", user.getHeader());

		RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
		dispatcher.forward(request, response);

	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Map<String, String[]> parameterMap = request.getParameterMap();	    

		List<Boolean> risposte=new ArrayList<Boolean>();
		
		for(Map.Entry<String, String[]> entry: parameterMap.entrySet()) {

			SoftSkillEnum domanda=SoftSkillEnum.valueOf(entry.getKey());
			if(domanda.getRisposta()==Integer.valueOf(entry.getValue()[0])) {
				risposte.add(true);
			}else {
				risposte.add(false);
			}
		}
		
		SoftSkillDAO dao=new SoftSkillDAO();
		dao.insertSoftSkill(user.getUsername(), risposte);
		
		user.setSoftSkill(true);
		
		response.sendRedirect("profilepage");
	}

}
