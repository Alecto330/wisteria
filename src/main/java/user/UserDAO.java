package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;
import utils.DatabaseConnection;

public class UserDAO {

	public User login(String email, String password) {
		String hashedPassword = null;
		User user=null;
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT password FROM Utente WHERE email = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next() && BCrypt.checkpw(password, resultSet.getString(1))==true) {

				query = "SELECT * FROM Utente WHERE email = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, email);
				resultSet = preparedStatement.executeQuery();

				if (resultSet.next()) {

					String username = resultSet.getString("username");
					String role = resultSet.getString("role");

					Class <? > userClass = Class.forName(role);
					user= (User)userClass.getDeclaredConstructor(String. class, String. class, String.class, String.class)
							.newInstance(username, email, hashedPassword, role);

					connection.close();
					return user;
				}
			}else {
				connection.close();
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/*public static void main(String[] args) {
		System.out.println(Candidate.class.getName()); //user.Candidate
		System.out.println(Admin.class.getName()); //user.Admin
		
		System.out.println(BCrypt.hashpw("admin", BCrypt.gensalt())); //$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku
		
	}*/

}
