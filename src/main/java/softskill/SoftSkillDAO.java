package softskill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
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
}
