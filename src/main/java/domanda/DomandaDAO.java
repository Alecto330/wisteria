package domanda;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
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


	public boolean checkRisposta(int domanda, int risposta) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT VoF from Risposta where id=? and FK_Domanda=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, risposta);
			preparedStatement.setInt(2, domanda);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();

			boolean check=resultSet.getBoolean("VoF");

			connection.close();

			return check;


		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	public int getPosizione(int domanda) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT FK_Posizione from Domanda where id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, domanda);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();

			int posizione=resultSet.getInt("FK_Posizione");

			connection.close();

			return posizione;


		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;

	}


	public void insertSiCandida(int posizione, String utente, int punteggio){
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query = "INSERT INTO SiCandida (FK_Posizione, FK_Utente, punteggio, data) VALUES (?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, posizione);
			preparedStatement.setString(2, utente);
			preparedStatement.setInt(3, punteggio);
			preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));

			preparedStatement.executeUpdate(); // Execute and get affected rows

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public int getNumeroDomande(int idPosizione) {
		int ndomande=0;
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT count(*) as ndomande from Domanda where FK_Posizione=? group by FK_Posizione";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, idPosizione);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();

			ndomande=resultSet.getInt("ndomande");

			connection.close();
			return ndomande;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ndomande;
	}


	public HashMap<Integer, Domanda> getDomandeFromIds(String[] ids){

		HashMap<Integer, Domanda> domande=new HashMap<Integer, Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 

			for(String id: ids) {
				String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, argomento, FK_Posizione, Risposta.id as rispostaId, risposta, VoF, FK_Domanda FROM Domanda join Risposta on Domanda.id=Risposta.FK_domanda where Domanda.id =? order by Domanda.id";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(id));
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
			}
			connection.close();
			return domande;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return domande;
	}

}
