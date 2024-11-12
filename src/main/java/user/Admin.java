package user;

public class Admin extends User{

	public Admin(String username, String password, String email, String role) {
		super(username, password, email, role);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getHeader() {
		// TODO Auto-generated method stub
		return "headerAmm.jsp";
	}
}