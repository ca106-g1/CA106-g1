package ToolClasses;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movieinfo.model.MovieInfoService;

public class Images extends HttpServlet {
	private static final long serialVersionUID = -5366057512615309761L;

	private MovieInfoService movieInfoService;

	@Override
	public void init() throws ServletException {
		
		movieInfoService = new MovieInfoService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}	
}
