package cv;

public class Esperienza {
	
	private int id;
	private String titolo;
	private String esperienza;
	
	public Esperienza(int id, String titolo, String esperienza) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.esperienza = esperienza;
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
	public String getEsperienza() {
		return esperienza;
	}
	public void setEsperienza(String esperienza) {
		this.esperienza = esperienza;
	}
}
