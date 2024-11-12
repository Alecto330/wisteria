package posizione;

import java.time.LocalDate;

public class Candidatura {
	
	private String posizione;
	private String utente;
	private int punteggio;
	private LocalDate data;
	
	public Candidatura(String posizione, String utente, int punteggio, LocalDate data) {
		super();
		this.posizione = posizione;
		this.utente = utente;
		this.punteggio = punteggio;
		this.data = data;
	}
	
	public String getPosizione() {
		return posizione;
	}
	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}
	public String getUtente() {
		return utente;
	}
	public void setUtente(String utente) {
		this.utente = utente;
	}
	public int getPunteggio() {
		return punteggio;
	}
	public void setPunteggio(int punteggio) {
		this.punteggio = punteggio;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
}
