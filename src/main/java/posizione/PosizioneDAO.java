package posizione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DatabaseConnection;

public class PosizioneDAO {

	public ArrayList<Posizione> getAllPosizioni() {

		ArrayList<Posizione> posizioni=new ArrayList<Posizione>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT id, titolo, descrizione, settore, Localita.provincia, Localita.regione FROM posizione"
					+ " join Localita on posizione.FK_Localita=Localita.provincia";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				int id=resultSet.getInt("id");
				String titolo=resultSet.getString("titolo");
				String descrizione=resultSet.getString("descrizione").substring(0, 200).concat("...");
				String settore=resultSet.getString("settore");
				String provincia=resultSet.getString("provincia");
				String regione=resultSet.getString("regione");

				Posizione posizione=new Posizione(id, titolo, descrizione, settore, provincia, regione);
				posizioni.add(posizione);

			}
			connection.close();
			return posizioni;


		}catch(Exception e) {
			e.printStackTrace();

		}
		return null;
	}


	public Posizione getPosizione(String id) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT titolo, descrizione, settore, Localita.provincia, Localita.regione FROM posizione"
					+ " join Localita on posizione.FK_Localita=Localita.provincia where id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(id));
			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next()) {
				String titolo=resultSet.getString("titolo");
				String descrizione=resultSet.getString("descrizione");
				String settore=resultSet.getString("settore");
				String provincia=resultSet.getString("provincia");
				String regione=resultSet.getString("regione");

				connection.close();
				return new Posizione(Integer.parseInt(id), titolo, descrizione, settore, provincia, regione);
			}

		}catch(Exception e) {
			e.printStackTrace();

		}
		return null;
	}
	
	
	public ArrayList<String> getAllProfessioni() {
		
		ArrayList<String> professioni=new ArrayList<String>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
				String query = "select distinct titolo from Posizione;";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String titolo=resultSet.getString("titolo");
				professioni.add(titolo);
		 
			}
			connection.close();
			return professioni;
			
			
		}catch(Exception e) {
			e.printStackTrace();

		}
		return null;
	}
	
	public ArrayList<String> getAllRegioni() {
		
		ArrayList<String> regioni=new ArrayList<String>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
				String query = "select distinct regione from Localita;";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String regione=resultSet.getString("regione");
				regioni.add(regione);
		 
			}
			connection.close();
			return regioni;
			
			
		}catch(Exception e) {
			e.printStackTrace();

		}
		return null;
	}

}
