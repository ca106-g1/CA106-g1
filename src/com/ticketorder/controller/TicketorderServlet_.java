package com.ticketorder.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.movieinfo.model.*;
import com.sessions.model.*;

@WebServlet("/ticketorder/TicketorderServlet_")
public class TicketorderServlet_ extends HttpServlet {
	private static final long serialVersionUID = 7545074246590891136L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getdate".equals(action)) {

			String movie_no = req.getParameter("movie_no");

			JSONArray array = new JSONArray();
			JSONArray array1 = new JSONArray();
			long now = (System.currentTimeMillis() / (24 * 60 * 60 * 1000)) * (24 * 60 * 60 * 1000);

			MovieInfoVO movieInfoVO = new MovieInfoService().getOneMovieInfo(movie_no);
			java.sql.Date movie_out = movieInfoVO.getMovie_out();
			long movie_out_second = movie_out.getTime();
			JSONObject jsonObject = new JSONObject();
			
			try {
				jsonObject.put("movie_name", movieInfoVO.getMovie_name());
				jsonObject.put("movie_intro", movieInfoVO.getMovie_intro());
				jsonObject.put("path", req.getContextPath()+"/ToolClasses/Images?action=movie_pic&movie_no="+movie_no);
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
			array.put(jsonObject);

			do {
				JSONObject jsonObject1 = new JSONObject();

				try {
					jsonObject1.put("date", new java.sql.Date(now).toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
				array1.put(jsonObject1);

				now += 24 * 60 * 60 * 1000;
			} while (movie_out_second >= now);
			array.put(array1);

			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}

		if ("getsessions".equals(action)) {
			
			String movie_no = req.getParameter("movie_no");
			java.sql.Date date = java.sql.Date.valueOf(req.getParameter("date"));
			java.sql.Date date2 = new java.sql.Date(date.getTime()+24*60*60*1000);
			
			
			JSONArray array = new JSONArray();
			
			for(SessionsVO sessionsVO : new SessionsService().getAll()) {
				
				if(sessionsVO.getSessions_start().after(date) && sessionsVO.getMovie_no().equals(movie_no) && sessionsVO.getSessions_start().before(date2)) {
					
					JSONObject jsonObject = new JSONObject();
					try {
						jsonObject.put("sessions_no", sessionsVO.getSessions_no());
						jsonObject.put("sessions_start", sessionsVO.getSessions_start().toString());
					} catch (JSONException e) {
						e.printStackTrace();
					}
					array.put(jsonObject);
				}
				
			}
			
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();

		}

		if("getsessions_remaining".equals(action)){
			JSONObject jsonObject = new JSONObject();
			String sessions_no = req.getParameter("sessions_no");
			SessionsService sessionsService = new SessionsService();
			try {
				jsonObject.put("sessions_remaining", sessionsService.getOneSes(sessions_no).getSessions_remaining());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(jsonObject.toString());
			out.flush();
			out.close();
			
			
		}
	}
	

}
