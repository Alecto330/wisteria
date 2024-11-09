package cv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import utils.DatabaseConnection;

public class CvDAO {

	public CV getCV(String username) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT cf, nome, cognome, DataDiNascita, Residenza, TitoloDiStudio, curriculum, fotoProfilo, telefono, FK_Utente FROM CV"
					+ " join Utente on CV.FK_Utente=Utente.username where CV.FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();
			
			String cf=resultSet.getString("cf");
			String nome=resultSet.getString("nome");
			String cognome=resultSet.getString("cognome");
			LocalDate dataDiNascita=resultSet.getDate("DataDiNascita").toLocalDate();;
			String residenza=resultSet.getString("Residenza");
			String titoloDiStudio=resultSet.getString("TitoloDiStudio");
			byte[] curriculum=resultSet.getBytes("curriculum");
			byte[] fotoProfilo=resultSet.getBytes("fotoProfilo");
			String telefono=resultSet.getString("telefono");
			String FK_Utente=resultSet.getString("FK_Utente");

			CV cv=new CV(username, cf, nome, cognome, dataDiNascita, residenza, titoloDiStudio, curriculum, fotoProfilo, telefono);

			connection.close();
			return cv;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}