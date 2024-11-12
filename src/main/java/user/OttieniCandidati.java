package user;

import java.util.ArrayList;

import posizione.Candidatura;

public interface OttieniCandidati {
	
	public default ArrayList<Candidatura> getCandidatiFromPosizione(int id) {
		return null;
	}

}
