package posizione;

public class Posizione {

	private int id;
	private String titolo;
	private String descrizione;
	private String settore;

	public Posizione(int id, String titolo, String descrizione, String settore) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.settore = settore;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getSettore() {
		return settore;
	}
	public void setSettore(String settore) {
		this.settore = settore;
	}



}
