package domanda;

public class Risposta {
	
	private int id;
	private String risposta;
	private boolean VoF;
	
	public Risposta(int id, String risposta, boolean voF) {
		super();
		this.id = id;
		this.risposta = risposta;
		VoF = voF;
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
	public boolean isVoF() {
		return VoF;
	}
	public void setVoF(boolean voF) {
		VoF = voF;
	}
	
	
	

}
