package com.cinema.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "/CinemaTool", loadOnStartup = 1, urlPatterns = "/CinemaTool")
public class CinemaTool extends HttpServlet{
	private static final long serialVersionUID = 1201483449723249054L;
	

	public class StatusOfSit{
		private String str;
		private String coller;
		private Integer type;
		
		private StatusOfSit(String str, String coller, Integer type){
			this.str = str;
			this.coller = coller;
			this.type = type;
		}

		public String getStr() {
			return str;
		}

		public String getColler() {
			return coller;
		}

		public Integer getType() {
			return type;
		}

		
	}
	
	public void init() throws ServletException {
		
		List<StatusOfSit> statusOfSitList = new ArrayList<StatusOfSit>();
		statusOfSitList.add(new StatusOfSit("���D","#fff", new Integer(0)));
		statusOfSitList.add(new StatusOfSit("�i��","#3f9", new Integer(1)));
		statusOfSitList.add(new StatusOfSit("���פ�","#999", new Integer(2)));
		statusOfSitList.add(new StatusOfSit("�l�a","#f00", new Integer(3)));
		statusOfSitList.add(new StatusOfSit("���","#333", new Integer(4)));
		statusOfSitList.add(new StatusOfSit("�Z��","#ee6", new Integer(5)));
		
		getServletContext().setAttribute("statusOfSitList", statusOfSitList);
		
		
	}
	
}
