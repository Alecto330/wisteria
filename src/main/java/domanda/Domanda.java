package domanda;

import java.util.ArrayList;

public class Domanda {
	
	private int id;
	private String domanda;
	private ArrayList<Risposta> risposte;
	
	public Domanda(int id, String domanda) {
		super();
		this.id = id;
		this.domanda = domanda;
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
	public ArrayList<Risposta> getRisposte() {
		return risposte;
	}

	public void setRisposte(ArrayList<Risposta> risposte) {
		this.risposte = risposte;
	}
	
}
