package softskill;

public class SoftSkill {
	
	private String username;
	private boolean skillOne;
	private boolean skillTwo;
	private boolean skillThree;
	private boolean skillFour;
	private boolean skillFive;
	
	public SoftSkill(String username, boolean skillOne, boolean skillTwo, boolean skillThree, boolean skillFour,
			boolean skillFive) {
		super();
		this.username = username;
		this.skillOne = skillOne;
		this.skillTwo = skillTwo;
		this.skillThree = skillThree;
		this.skillFour = skillFour;
		this.skillFive = skillFive;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean getSkillOne() {
		return skillOne;
	}

	public void setSkillOne(boolean skillOne) {
		this.skillOne = skillOne;
	}

	public boolean getSkillTwo() {
		return skillTwo;
	}

	public void setSkillTwo(boolean skillTwo) {
		this.skillTwo = skillTwo;
	}

	public boolean getSkillThree() {
		return skillThree;
	}

	public void setSkillThree(boolean skillThree) {
		this.skillThree = skillThree;
	}

	public boolean getSkillFour() {
		return skillFour;
	}

	public void setSkillFour(boolean skillFour) {
		this.skillFour = skillFour;
	}

	public boolean getSkillFive() {
		return skillFive;
	}

	public void setSkillFive(boolean skillFive) {
		this.skillFive = skillFive;
	}
}
