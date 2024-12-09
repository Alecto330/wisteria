package user;

import java.util.ArrayList;

import posizione.Candidatura;

public interface Permessi {
	
	public default ArrayList<Candidatura> getCandidatiFromPosizione(int id) {
		return null;
	}
	
	public default boolean accediACreaPosizione() {
		return false;
	}
	
	public default boolean eseguiTest() {
		return false;
	}
	
	public default boolean visualizzaCandidato() {
		return false;
	}

}
