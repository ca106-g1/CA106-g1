package com.cinema.controller;

import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinema.model.*;


@WebServlet(name = "/CinemaServlet", loadOnStartup = 1, urlPatterns = "/CinemaServlet")
public class CinemaServlet extends HttpServlet{
	private static final long serialVersionUID = -6487812844357722812L;
	
	private List<CinemaVO> list;
	private Map<String, CinemaVO> map;
	private CinemaService cinemaService;
		

	@Override
	public void init() throws ServletException {
		
		cinemaService = new CinemaService();
		list = new Vector<CinemaVO>();
		map = new Hashtable<String, CinemaVO>();
		
		ServletContext sc = getServletContext();
		
		sc.setAttribute("cinemaList", list);
		sc.setAttribute("cinemaMap", map);
		
		fresh();
		
		
	}
	
	private void fresh() {
		
		list.clear();
		map.clear();
		
		for (CinemaVO cinemaVO : cinemaService.getAll()) {
			list.add(cinemaVO);
		}
		
		for (CinemaVO cinemaVO : list) {
			map.put(cinemaVO.getCinema_no(), cinemaVO);
		}
		
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("updateCinema".equals(action)) {
			
			cinemaService.updateCin(req.getParameter("cinema_no"), req.getParameter("cinema_type"), new Integer(req.getParameter("cinema_size")), req.getParameter("cinema_name"), new Integer(req.getParameter("cinema_correct")), req.getParameter("cinema_status"));
			fresh();
			req.getRequestDispatcher("/Back_end/cinema/ListAllCinema.jsp").forward(req, res);
		}
		
		
		
	}
	
	

}
