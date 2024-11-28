package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

				query = "SELECT Utente.username, pw, email, ruolo, SoftSkill.FK_Utente as softskill FROM Utente left join SoftSkill on Utente.username=SoftSkill.FK_Utente WHERE email = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, email);
				resultSet = preparedStatement.executeQuery();

				if (resultSet.next()) {

					String username = resultSet.getString("username");
					String role = resultSet.getString("ruolo");

					String softskillString=resultSet.getString("softskill");
					boolean softSkill=false;
					if(softskillString!=null) {
						softSkill=true;
					}

					Class <? > userClass = Class.forName(role);
					user= (User)userClass.getDeclaredConstructor(String.class, String.class, String.class, String.class, boolean.class)
							.newInstance(username, null, email, role, softSkill);

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


	public void insertUser(String nome, String cognome, String username, String password, String email, String codiceFiscale, LocalDate dateOfBirth) throws Exception {
		//TODO ROLE!
		String hashPassword=BCrypt.hashpw(password, BCrypt.gensalt());

		DatabaseConnection database = new DatabaseConnection();
		Connection connection = database.getConnection();
		String query ="INSERT INTO Utente (username, pw, email, ruolo) VALUES (?, ?, ?, ?)";
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, hashPassword);
		preparedStatement.setString(3, email);
		preparedStatement.setString(4, "user.Candidate");
		preparedStatement.executeUpdate();

		query ="INSERT INTO CV (cf, nome, cognome, DataDiNascita, FK_Utente) VALUES (?, ?, ?, ?, ?)";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, codiceFiscale);
		preparedStatement.setString(2, nome);
		preparedStatement.setString(3, cognome);
		preparedStatement.setDate(4, Date.valueOf(dateOfBirth));
		preparedStatement.setString(5, username);
		preparedStatement.executeUpdate();

		connection.close();
	}


	public void updateUsername(String username, String newUsername) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE Utente SET username = ? WHERE username= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newUsername);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateEmail(String username, String email) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE Utente SET email = ? WHERE username= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

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