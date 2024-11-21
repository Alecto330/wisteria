package domanda;

public class Risposta {
	
	private int id;
	private String risposta;
	private boolean vof;
	
	public Risposta(int id, String risposta, boolean vof) {
		super();
		this.id = id;
		this.risposta = risposta;
		this.vof = vof;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRisposta() {
		return risposta;
	}
	public void setRisposta(String risposta) {
		this.risposta = risposta;
	}
	public boolean getVof() {
		return this.vof;
	}
	public void setVof(boolean voF) {
		this.vof = voF;
	}
}
