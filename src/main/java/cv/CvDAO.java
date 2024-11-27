package cv;

import java.io.InputStream;
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
			String query = "SELECT cf, nome, cognome, DataDiNascita, Residenza, TitoloDiStudio, curriculum, fotoProfilo, telefono, email, CV.FK_Utente, SoftSkill.FK_Utente as softskill FROM CV\n"
					+ "join Utente on CV.FK_Utente=Utente.username\n"
					+ "join SoftSkill on CV.FK_Utente=SoftSkill.FK_Utente\n"
					+ "where CV.FK_Utente= ?";
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
			String email=resultSet.getString("email");
			String softskillString=resultSet.getString("softskill");
			boolean softSkill=false;
			if(softskillString!=null) {
				softSkill=true;
			}
			
			CV cv=new CV(username, cf, nome, cognome, dataDiNascita, residenza, titoloDiStudio, curriculum, fotoProfilo, telefono, email, softSkill);

			connection.close();
			return cv;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateNome(String username, String nome) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET nome = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, nome);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateCognome(String username, String cognome) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET cognome = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, cognome);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void updateDataDiNascita(String username, String dataDiNascita) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET DataDiNascita = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, dataDiNascita);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateCf(String username, String cf) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET nome = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, cf);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateTelefono(String username, String telefono) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET telefono = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, telefono);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateTitolo(String username, String titolo) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET TitoloDiStudio = ? WHERE FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, titolo);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateCV(String username, InputStream inputStream, long size) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET curriculum = ? WHERE FK_Utente= ?";
			
			//InputStream inputStream = cv.getInputStream();
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setBinaryStream(1, inputStream, size);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateImage(String username, InputStream inputStream, long size) {
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection();
			String query ="UPDATE CV SET fotoProfilo = ? WHERE FK_Utente= ?";
			
			//InputStream inputStream = cv.getInputStream();
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setBinaryStream(1, inputStream, size);
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getCf(String username) {
		String cf="";
		try {
			DatabaseConnection database = new DatabaseConnection();
			Connection connection = database.getConnection(); 
			String query = "SELECT cf from CV where FK_Utente= ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();

			cf=resultSet.getString("cf");

			connection.close();
			return cf;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return cf;
	}


}