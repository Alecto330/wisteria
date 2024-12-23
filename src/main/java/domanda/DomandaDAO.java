package domanda;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import utils.DatabaseConnection;

public class DomandaDAO {


	public HashMap<Integer, Domanda> getDomande() {
		HashMap<Integer, Domanda> domande=new HashMap<Integer, Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, Risposta.id as rispostaId, risposta, VoF FROM Domanda join Risposta on Domanda.id=Risposta.FK_domanda group by domanda, Domanda.id, Risposta.id, risposta, VoF, FK_Domanda order by Domanda.id";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				int domandaId=resultSet.getInt("domandaId");
				if(!domande.containsKey(domandaId)) {
					String domandaTesto=resultSet.getString("domanda");
					//int FK_Posizione=resultSet.getInt("FK_Posizione");

					Domanda domanda=new Domanda(domandaId, domandaTesto);


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
			String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, Risposta.id as rispostaId, risposta, VoF FROM Domanda \r\n"
					+ "join Risposta on Domanda.id=Risposta.FK_domanda\r\n"
					+ "join ListaDomande on Domanda.id=ListaDomande.FK_Domanda\r\n"
					+ "where FK_Posizione=? order by Domanda.id";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, idPosizione);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				int domandaId=resultSet.getInt("domandaId");
				if(!domande.containsKey(domandaId)) {
					String domandaTesto=resultSet.getString("domanda");

					Domanda domanda=new Domanda(domandaId, domandaTesto);


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
			String query = "SELECT FK_Posizione from ListaDomande where FK_Domanda=?";
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
			String query = "SELECT count(*) as ndomande from ListaDomande where ListaDomande.FK_Posizione=? group by ListaDomande.FK_Posizione";
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


	public ArrayList<Domanda> getDomandeFromIds(String[] ids){

		ArrayList<Domanda> domande=new ArrayList<Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 

			for(String id: ids) {
				String query = "SELECT DISTINCT Domanda.id as domandaId, domanda FROM Domanda where Domanda.id = ? order by Domanda.id";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(id));
				ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {

					int domandaId=resultSet.getInt("domandaId");
					String domandaTesto=resultSet.getString("domanda");

					Domanda domanda=new Domanda(domandaId, domandaTesto);
					domande.add(domanda);
				}
			}
			connection.close();
			return domande;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return domande;
	}


	public Domanda insertDomandaRisposte(String domanda, String[] risposte, int corretta){

		int domandaId=0;
		int rispostaId=0;
		boolean vof=false;
		Domanda domandaOggetto=null;
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query = "INSERT INTO Domanda (domanda) VALUES (?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, domanda);
			preparedStatement.executeUpdate();

			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
			if (generatedKeys.next()) {
				domandaId = generatedKeys.getInt(1);

			}


			domandaOggetto=new Domanda(domandaId, domanda);

			for(int i=0; i<risposte.length; i++) {
				query = "INSERT INTO Risposta (risposta, VoF, FK_Domanda) VALUES (?, ?, ?)";
				preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				preparedStatement.setString(1, risposte[i]);
				if (i == corretta) {
					preparedStatement.setBoolean(2, true);
					vof=true;
				} else {
					preparedStatement.setBoolean(2, false);
					vof=false;
				}
				preparedStatement.setInt(3, domandaId);
				preparedStatement.executeUpdate();


				generatedKeys = preparedStatement.getGeneratedKeys();
				if (generatedKeys.next()) {
					rispostaId = generatedKeys.getInt(1);

				}

				Risposta risposta=new Risposta(rispostaId, risposte[i], vof);
				domandaOggetto.getRisposte().add(risposta);
			}

			connection.close();

			return domandaOggetto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return domandaOggetto;

	}
	
	public HashMap<Integer, Domanda> getFilteredDomande(String filter) {
		String filterWithWildcards = "%" + filter + "%";
		HashMap<Integer, Domanda> domande=new HashMap<Integer, Domanda>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT DISTINCT Domanda.id as domandaId, domanda, Risposta.id as rispostaId, risposta, VoF\r\n"
					+ "FROM Domanda join Risposta on Domanda.id=Risposta.FK_domanda\r\n"
					+ "group by domanda, Domanda.id, Risposta.id, risposta, VoF, FK_Domanda\r\n"
					+ "having domanda like ? order by Domanda.id;";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, filterWithWildcards);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				int domandaId=resultSet.getInt("domandaId");
				if(!domande.containsKey(domandaId)) {
					String domandaTesto=resultSet.getString("domanda");
					//int FK_Posizione=resultSet.getInt("FK_Posizione");

					Domanda domanda=new Domanda(domandaId, domandaTesto);


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
