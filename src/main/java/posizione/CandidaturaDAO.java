package posizione;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import utils.DatabaseConnection;

public class CandidaturaDAO {


	public ArrayList<Candidatura> getCandidature(int id) {
		ArrayList<Candidatura> candidature=new ArrayList<Candidatura>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT * FROM SiCandida join Posizione on SiCandida.FK_Posizione = Posizione.id where Posizione.id=? order by punteggio desc";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();


			while (resultSet.next()) {

				String posizione = resultSet.getString("titolo");
				String utente = resultSet.getString("FK_Utente");
				int punteggio = resultSet.getInt("punteggio");
				LocalDate data = resultSet.getDate("data").toLocalDate();

				Candidatura candidatura=new Candidatura(posizione, utente, punteggio, data);
				
				candidature.add(candidatura);
			}
			
			connection.close();
			return candidature;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
