package com.farediscount.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farediscount.model.*;


@WebServlet("/farediscount/FarediscountServlet")
public class FarediscountServlet extends HttpServlet{
	

	private static final long serialVersionUID = -1921776397555789457L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 req.setCharacterEncoding("UTF-8");
		 String action = req.getParameter("action");
		 
		 if("insert".equals(action)){
			 List<String> errorMessage = new ArrayList<String>();
			 String fd_name = req.getParameter("fd_name");
			 String fd_offer = req.getParameter("fd_offer");
			 String fd_start = req.getParameter("fd_start");
			 String fd_end = req.getParameter("fd_end");
			 String fd_upper = req.getParameter("fd_upper");
			 String fd_lower = req.getParameter("fd_lower");
			 
			 
		 }
		
	}
	
	
}
