package softskill;

public enum SoftSkillEnum {
	
	uno(1, 2),
	due(2, 3),
	tre(3, 3),
	quattro(4, 2),
	cinque(5, 1);
	
	private final int domanda;
	private final int risposta;
	
	SoftSkillEnum(int domanda, int risposta) {
		this.domanda=domanda;
		this.risposta=risposta;
	}

	public int getDomanda() {
		return domanda;
	}

	public int getRisposta() {
		return risposta;
	}
}
