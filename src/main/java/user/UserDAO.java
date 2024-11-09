package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;

import org.mindrot.jbcrypt.BCrypt;
import utils.DatabaseConnection;

public class UserDAO {

	public User login(String email, String password) {
		User user=null;
		
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT pw FROM Utente WHERE email = ?";
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
					String role = resultSet.getString("ruolo");

					Class <? > userClass = Class.forName(role);
					user= (User)userClass.getDeclaredConstructor(String.class, String.class, String.class, String.class)
							.newInstance(username, null, email, role);

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
	
	
	public void insertUser(String nome, String cognome, String username, String password, String email, String codiceFiscale, LocalDate dateOfBirth) {
		//TODO ROLE!
		String hashPassword=BCrypt.hashpw(password, BCrypt.gensalt());
		
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="INSERT INTO Utenti (nome, cognome, username, pw, email, dateOfBirth, codiceFiscale) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, nome);
			preparedStatement.setString(2, cognome);
			preparedStatement.setString(3, username);
			preparedStatement.setString(4, hashPassword);
			preparedStatement.setString(5, email);
			preparedStatement.setDate(6, Date.valueOf(dateOfBirth));
			preparedStatement.setString(7, codiceFiscale);

			preparedStatement.executeUpdate();
			/*ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
			if (generatedKeys.next()) {
				int generatedId = generatedKeys.getInt(1);

			}*/
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*public static void main(String[] args) {
		System.out.println(Candidate.class.getName()); //user.Candidate
		System.out.println(Admin.class.getName()); //user.Admin
		
		System.out.println(BCrypt.hashpw("admin", BCrypt.gensalt())); //$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku
		
	}*/
}