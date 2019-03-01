package com.ticketorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ticketorder/TicketorderServlet_")
public class TicketorderServlet_ extends HttpServlet{
	private static final long serialVersionUID = 7545074246590891136L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");
		
		
	}
	/*動過package com.ticketorder.controller;
	 public class Images extends HttpServlet {
	 public class MyRequest extends HttpServletRequestWrapper {*/
	
	

}
