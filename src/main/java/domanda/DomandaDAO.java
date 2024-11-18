package domanda;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import utils.DatabaseConnection;

public class DomandaDAO {


	public HashMap<Integer, Domanda> getDomande() {
		HashMap<Integer, Domanda> domande=new HashMap<Integer, Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, argomento, FK_Posizione, Risposta.id as rispostaId, risposta, VoF, FK_Domanda FROM Domanda join Risposta on Domanda.id=Risposta.FK_domanda order by Domanda.id";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {

				int domandaId=resultSet.getInt("domandaId");
				if(!domande.containsKey(domandaId)) {
					String domandaTesto=resultSet.getString("domanda");
					String argomento=resultSet.getString("argomento");
					int FK_Posizione=resultSet.getInt("FK_Posizione");

					Domanda domanda=new Domanda(domandaId, domandaTesto, argomento, FK_Posizione);


					int rispostaId=resultSet.getInt("rispostaId");
					String risposta=resultSet.getString("risposta");
					boolean vof=resultSet.getBoolean("VoF");

					Risposta primaRisposta=new Risposta(rispostaId, risposta, vof);
					
					domanda.getRisposte().add(primaRisposta);
					
					domande.put(domandaId, domanda);
				}else {
					
					int rispostaId=resultSet.getInt("rispostaId");
					String risposta=resultSet.getString("risposta");
					boolean vof=resultSet.getBoolean("VoF");

					Risposta rispostaSuccessiva=new Risposta(rispostaId, risposta, vof);

					domande.get(domandaId).getRisposte().add(rispostaSuccessiva);
				}
			}
			connection.close();
			return domande;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public HashMap<Integer, Domanda> getDomandeFromPosizione(int idPosizione) {
		HashMap<Integer, Domanda> domande=new HashMap<Integer, Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, argomento, FK_Posizione, Risposta.id as rispostaId, risposta, VoF, FK_Domanda FROM Domanda join Risposta on Domanda.id=Risposta.FK_domanda where FK_Posizione=? order by Domanda.id";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, idPosizione);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {

				int domandaId=resultSet.getInt("domandaId");
				if(!domande.containsKey(domandaId)) {
					String domandaTesto=resultSet.getString("domanda");
					String argomento=resultSet.getString("argomento");
					int FK_Posizione=resultSet.getInt("FK_Posizione");

					Domanda domanda=new Domanda(domandaId, domandaTesto, argomento, FK_Posizione);


					int rispostaId=resultSet.getInt("rispostaId");
					String risposta=resultSet.getString("risposta");
					boolean vof=resultSet.getBoolean("VoF");

					Risposta primaRisposta=new Risposta(rispostaId, risposta, vof);

					domanda.getRisposte().add(primaRisposta);
					
					domande.put(domandaId, domanda);
				}else {
					
					int rispostaId=resultSet.getInt("rispostaId");
					String risposta=resultSet.getString("risposta");
					boolean vof=resultSet.getBoolean("VoF");

					Risposta rispostaSuccessiva=new Risposta(rispostaId, risposta, vof);

					domande.get(domandaId).getRisposte().add(rispostaSuccessiva);
				}
			}
			connection.close();
			return domande;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
