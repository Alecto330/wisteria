package domanda;

import java.util.ArrayList;

public class Domanda {
	
	private int id;
	private String domanda;
	private int posizione;
	private ArrayList<Risposta> risposte;
	
	public Domanda(int id, String domanda, int posizione) {
		super();
		this.id = id;
		this.domanda = domanda;
		this.posizione = posizione;
		this.risposte=new ArrayList<Risposta>();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDomanda() {
		return domanda;
	}
	public void setDomanda(String domanda) {
		this.domanda = domanda;
	}
	public int getPosizione() {
		return posizione;
	}
	public void setPosizione(int posizione) {
		this.posizione = posizione;
	}

	public ArrayList<Risposta> getRisposte() {
		return risposte;
	}

	public void setRisposte(ArrayList<Risposta> risposte) {
		this.risposte = risposte;
	}
	
}
