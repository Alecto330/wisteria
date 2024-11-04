package wisteria;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import posizione.Posizione;


@WebServlet("/offerta")
public class offerta extends HttpServlet{
	
	public offerta() {
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read JSON data from the request body.
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        String jobJson = jsonBuilder.toString();

        // Convert JSON to a Job object (using a library like Gson or Jackson).
        Gson gson = new Gson();
        Posizione job = gson.fromJson(jobJson, Posizione.class);

        // Store the job object in the session.
        request.getSession().setAttribute("selectedJob", job);

        response.setStatus(HttpServletResponse.SC_OK);
    }

}
