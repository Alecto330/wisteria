package cv;

import java.time.LocalDate;

public class CV {
	
	private String username;
	private String cf;
	private String nome;
	private String cognome;
	private LocalDate dataDiNascita;
	private String residenza;
	private String titoloDiStudio;
	private byte[] curriculum;
	private byte[] fotoProfilo;
	private String telefono;
	private String email;
	private boolean softSkill;
	
	public CV(String username, String cf, String nome, String cognome, LocalDate dataDiNascita, String residenza,
			String titoloDiStudio, byte[] curriculum, byte[] fotoProfilo, String telefono, String email,
			boolean softSkill) {
		super();
		this.username = username;
		this.cf = cf;
		this.nome = nome;
		this.cognome = cognome;
		this.dataDiNascita = dataDiNascita;
		this.residenza = residenza;
		this.titoloDiStudio = titoloDiStudio;
		this.curriculum = curriculum;
		this.fotoProfilo = fotoProfilo;
		this.telefono = telefono;
		this.email = email;
		this.softSkill = softSkill;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCf() {
		return cf;
	}

	public void setCf(String cf) {
		this.cf = cf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public LocalDate getDataDiNascita() {
		return dataDiNascita;
	}

	public void setDataDiNascita(LocalDate dataDiNascita) {
		this.dataDiNascita = dataDiNascita;
	}

	public String getResidenza() {
		return residenza;
	}

	public void setResidenza(String residenza) {
		this.residenza = residenza;
	}

	public String getTitoloDiStudio() {
		return titoloDiStudio;
	}

	public void setTitoloDiStudio(String titoloDiStudio) {
		this.titoloDiStudio = titoloDiStudio;
	}

	public byte[] getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(byte[] curriculum) {
		this.curriculum = curriculum;
	}

	public byte[] getFotoProfilo() {
		return fotoProfilo;
	}

	public void setFotoProfilo(byte[] fotoProfilo) {
		this.fotoProfilo = fotoProfilo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getSoftSkill() {
		return softSkill;
	}

	public void setSoftSkill(boolean softSkill) {
		this.softSkill = softSkill;
	}

}