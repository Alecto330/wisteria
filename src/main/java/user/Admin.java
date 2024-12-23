package user;

import java.util.ArrayList;

import posizione.Candidatura;
import posizione.CandidaturaDAO;

public class Admin extends User{

	public Admin(String username, String password, String email, String role, boolean softSkill) {
		super(username, password, email, role, softSkill);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getHeader() {
		// TODO Auto-generated method stub
		return "headerAmm.jsp";
	}

	@Override
	public String getOfferta() {
		// TODO Auto-generated method stub
		return "offertaAmm.jsp";
	}
	
	@Override
	public ArrayList<Candidatura> getCandidatiFromPosizione(int id) {
		
		CandidaturaDAO dao=new CandidaturaDAO();
		return dao.getCandidature(id);
	}
	
	@Override
	public boolean accediACreaPosizione() {
		return true;
	}

	@Override
	public boolean isProfileComplete() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public boolean visualizzaCandidato() {
		return true;
	}
}