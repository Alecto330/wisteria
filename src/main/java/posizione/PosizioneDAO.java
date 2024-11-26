package posizione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import utils.DatabaseConnection;

public class PosizioneDAO {

	public ArrayList<Posizione> getAllPosizioni() {

		ArrayList<Posizione> posizioni=new ArrayList<Posizione>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT id, titolo, descrizione, settore, chiusa, utente_scelto, Localita.provincia, Localita.regione FROM posizione"
					+ " join Localita on posizione.FK_Localita=Localita.provincia";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				int id=resultSet.getInt("id");
				String titolo=resultSet.getString("titolo");
				String descrizione=resultSet.getString("descrizione");
				if(descrizione.length()>=200) {
					descrizione=descrizione.substring(0, 200).concat("...");
				}
				String settore=resultSet.getString("settore");
				String provincia=resultSet.getString("provincia");
				String regione=resultSet.getString("regione");
				boolean chiusa=resultSet.getBoolean("chiusa");
				String utenteScelto=resultSet.getString("utente_scelto");

				Posizione posizione=new Posizione(id, titolo, descrizione, settore, provincia, regione, chiusa, utenteScelto);
				posizioni.add(posizione);
			}
			connection.close();
			return posizioni;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Posizione> getFilteredPosizioni(String descrizione, String regione, String professione) {

		ArrayList<Posizione> posizioni = new ArrayList<>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();

			StringBuilder queryBuilder = new StringBuilder("SELECT id, titolo, descrizione, settore, chiusa, utente_scelto, Localita.provincia, Localita.regione FROM posizione JOIN Localita ON posizione.FK_Localita = Localita.provincia");
			ArrayList<String> whereConditions = new ArrayList<>();

			if (descrizione != null && !descrizione.isEmpty()) {
				whereConditions.add("descrizione LIKE ? or titolo LIKE ? or settore LIKE ?");
			}
			if (regione != null && !regione.isEmpty()) {
				whereConditions.add("Localita.regione = ?");
			}
			if (professione != null && !professione.isEmpty()) {
				whereConditions.add("settore = ?");
			}

			if (!whereConditions.isEmpty()) {
				queryBuilder.append(" WHERE ").append(String.join(" AND ", whereConditions));
			}

			PreparedStatement preparedStatement = connection.prepareStatement(queryBuilder.toString());
			int parameterIndex = 1;

			if (descrizione != null && !descrizione.isEmpty()) {
				String likePattern = "%" + descrizione + "%";
				preparedStatement.setString(parameterIndex++, likePattern); // for descrizione LIKE ?
				preparedStatement.setString(parameterIndex++, likePattern); // for titolo LIKE ?
				preparedStatement.setString(parameterIndex++, likePattern); // for titolo LIKE ?
			}

			if (regione != null && !regione.isEmpty()) {
				preparedStatement.setString(parameterIndex++, regione);
			}
			if (professione != null && !professione.isEmpty()) {
				preparedStatement.setString(parameterIndex++, professione);
			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String titolo = resultSet.getString("titolo");
				String descrizioneVal = resultSet.getString("descrizione");
				if(descrizioneVal.length()>=200) {
					descrizioneVal=descrizioneVal.substring(0, 200).concat("...");
				}				
				String settore = resultSet.getString("settore");
				String provinciaVal = resultSet.getString("provincia");
				String regioneVal = resultSet.getString("regione");
				boolean chiusa=resultSet.getBoolean("chiusa");
				String utenteScelto=resultSet.getString("utente_scelto");

				Posizione posizione = new Posizione(id, titolo, descrizioneVal, settore, provinciaVal, regioneVal, chiusa, utenteScelto);
				posizioni.add(posizione);
			}

			connection.close();
			return posizioni;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Posizione getPosizione(String id) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT titolo, descrizione, settore, chiusa, utente_scelto, Localita.provincia, Localita.regione FROM posizione"
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
				boolean chiusa=resultSet.getBoolean("chiusa");
				String utenteScelto=resultSet.getString("utente_scelto");

				Posizione posizione=new Posizione(Integer.parseInt(id), titolo, descrizione, settore, provincia, regione, chiusa, utenteScelto);
				connection.close();
				return posizione;
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
			String query = "select distinct settore from Posizione order by settore";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				String titolo=resultSet.getString("settore");
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
			String query = "select distinct regione from Localita order by regione";
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

	public ArrayList<String> getAllProvince() {

		ArrayList<String> province=new ArrayList<String>();

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "select distinct provincia from Localita order by provincia";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				String regione=resultSet.getString("provincia");
				province.add(regione);
			}
			connection.close();
			return province;


		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getRegioneFromProvincia(String provincia) {

		String regione="";

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "select regione from Localita where provincia = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, provincia);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				regione=resultSet.getString("regione");
			}
			connection.close();
			return regione;


		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertPosizione(Posizione posizione, String username) {
		int generatedId=0;
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="INSERT INTO Posizione (titolo, descrizione, settore, FK_Localita) VALUES (?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, posizione.getTitolo());
			preparedStatement.setString(2, posizione.getDescrizione());
			preparedStatement.setString(3, posizione.getSettore());
			preparedStatement.setString(4, posizione.getProvincia());
			preparedStatement.executeUpdate();
			
			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
			if (generatedKeys.next()) {
				generatedId = generatedKeys.getInt(1);

			}
			return generatedId;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return generatedId;
	}
	
	public void insertDomandeForPosizione(int domandaId, int posizioneId) {

		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="INSERT INTO ListaDomande (FK_Domanda, FK_Posizione) VALUES (?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, domandaId);
			preparedStatement.setInt(2, posizioneId);
			preparedStatement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletePosizione(int posizioneId) throws Exception {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query = "DELETE FROM posizioni WHERE id = ?";

			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setInt(1, posizioneId);
			stmt.executeUpdate();

			connection.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}