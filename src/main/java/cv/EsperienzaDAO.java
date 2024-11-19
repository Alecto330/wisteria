package cv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DatabaseConnection;

public class EsperienzaDAO {


	public ArrayList<Esperienza> getEsperienzeFromCV(String cf){
		ArrayList<Esperienza> esperienze=new ArrayList<Esperienza>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "select * from Esperienza where FK_CV=? order by id desc";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, cf);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int id=resultSet.getInt("id");
				String titolo=resultSet.getString("titolo");
				String esperienza=resultSet.getString("esperienza");

				Esperienza esperienzaOggetto=new Esperienza(id, titolo, esperienza);
				esperienze.add(esperienzaOggetto);
			}
			connection.close();
			return esperienze;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return esperienze;

	}

	public void insertEsperienza(String titolo, String descrizione, String cf) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="INSERT INTO Esperienza (titolo, esperienza, FK_CV) VALUES (?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, titolo);
			preparedStatement.setString(2, descrizione);
			preparedStatement.setString(3, cf);
			preparedStatement.executeUpdate();

			connection.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteEsperienza(int idEsperienza) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="DELETE from Esperienza where id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, idEsperienza);
			preparedStatement.executeUpdate();

			connection.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


}
