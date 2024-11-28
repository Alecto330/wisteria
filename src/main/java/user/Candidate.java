package user;

public class Candidate extends User{
	
	public Candidate(String username, String password, String email, String role, boolean softSkill) {
		super(username, password, email, role, softSkill);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getHeader() {		
		return "header.jsp";
	}

	@Override
	public String getOfferta() {
		return "offerta.jsp";
	}
	
	@Override
	public boolean eseguiTest() {
		return true;
	}
	
}