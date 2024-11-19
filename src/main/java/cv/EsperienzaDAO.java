package cv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import domanda.Domanda;
import domanda.Risposta;
import utils.DatabaseConnection;

public class EsperienzaDAO {


	public ArrayList<Esperienza> getEsperienzeFromCV(String cf){
		ArrayList<Esperienza> esperienze=new ArrayList<Esperienza>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "select * from Esperienza where FK_CV=?";
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

}
