package posizione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import utils.DatabaseConnection;

public class PosizioneDAO {

	public HashMap<Integer, Posizione> getAllPosizioni() {
		
		HashMap<Integer, Posizione> posizioni=new HashMap<Integer, Posizione>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT id, titolo, descrizione, settore, FK_Localita FROM posizione";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int id=resultSet.getInt("id");
				String titolo=resultSet.getString("titolo");
				String descrizione=resultSet.getString("descrizione").substring(0, 200).concat("...");
				String settore=resultSet.getString("settore");
				String localita=resultSet.getString("FK_Localita");
				
				Posizione posizione=new Posizione(id, titolo, descrizione, settore, localita);
				posizioni.put(id, posizione);
		 
			}
			return posizioni;
			
			
		}catch(Exception e) {
			e.printStackTrace();

		}
		return null;
	}


}
