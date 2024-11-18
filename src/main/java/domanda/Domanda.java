package domanda;

import java.util.ArrayList;

public class Domanda {
	
	private int id;
	private String domanda;
	private String argomento;
	private int posizione;
	private ArrayList<Risposta> risposte;
	
	public Domanda(int id, String domanda, String argomento, int posizione) {
		super();
		this.id = id;
		this.domanda = domanda;
		this.argomento = argomento;
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
	public String getArgomento() {
		return argomento;
	}
	public void setArgomento(String argomento) {
		this.argomento = argomento;
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
