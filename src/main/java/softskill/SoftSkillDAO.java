package softskill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

import posizione.Candidatura;
import utils.DatabaseConnection;

public class SoftSkillDAO {

	public void insertSoftSkill(String utente, List<Boolean> risposte){
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query = "INSERT INTO SoftSkill (FK_Utente, skill_1, skill_2, skill_3, skill_4, skill_5) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, utente);
			preparedStatement.setBoolean(2, risposte.get(0));
			preparedStatement.setBoolean(3, risposte.get(1));
			preparedStatement.setBoolean(4, risposte.get(2));
			preparedStatement.setBoolean(5, risposte.get(3));
			preparedStatement.setBoolean(6, risposte.get(4));

			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SoftSkill getSoftSkills(String username) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT * FROM SoftSkill where FK_Utente=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();


			resultSet.next();

			boolean skill1 = resultSet.getBoolean("skill_1");
			boolean skill2 = resultSet.getBoolean("skill_2");
			boolean skill3 = resultSet.getBoolean("skill_3");
			boolean skill4 = resultSet.getBoolean("skill_4");
			boolean skill5 = resultSet.getBoolean("skill_5");

			SoftSkill skill=new SoftSkill(username, skill1, skill2, skill3, skill4, skill5);



			connection.close();
			return skill;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
