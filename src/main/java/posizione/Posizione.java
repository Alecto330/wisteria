package posizione;

public class Posizione {

	private int id;
	private String titolo;
	private String descrizione;
	private String settore;
	private String provincia;
	private String regione;
	
	public Posizione(int id, String titolo, String descrizione, String settore, String provincia, String regione) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.settore = settore;
		this.provincia = provincia;
		this.regione = regione;
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
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getRegione() {
		return regione;
	}
	public void setRegione(String regione) {
		this.regione = regione;
	}
}
