package com.sessions.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import com.cinema.model.CinemaVO;
import com.movieinfo.model.*;
import com.sessions.model.*;

import ToolClasses.MyRequest;

@WebServlet(name = "/sessions/SessionServlet", loadOnStartup = 1, urlPatterns = "/sessions/SessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 6787696732983961662L;

	private SessionsService sessionsService;
	private List<SessionsVO> list_all;
	private Map<String, SessionsVO> map;
	private Map<String, MovieInfoVO> movieMap;
	private MovieInfoService movieInfoService;

	@Override
	public void init() throws ServletException {

		sessionsService = new SessionsService();
		movieInfoService = new MovieInfoService();

		list_all = new Vector<SessionsVO>();
		map = new Hashtable<String, SessionsVO>();
		movieMap = new Hashtable<String, MovieInfoVO>();

		ServletContext context = getServletContext();

		context.setAttribute("sessionList_all", list_all);
		context.setAttribute("sessionMap", map);
		context.setAttribute("movieMap", movieMap);

		freshSessions();
		freshMovieInfoVO();
	}

	private void freshSessions() {

		list_all.clear();

		long time = System.currentTimeMillis();

		for (SessionsVO sessionsVO : sessionsService.getAll()) {

			list_all.add(sessionsVO);

			if (sessionsVO.getSessions_start().getTime() > time) {
				map.put(sessionsVO.getSessions_no(), sessionsVO);
			}

		}

	}

	private void freshMovieInfoVO() {
		movieMap.clear();

		for (MovieInfoVO movieInfoVO : movieInfoService.getAll()) {

			movieMap.put(movieInfoVO.getMovie_no(), movieInfoVO);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insertSessions".equals(action)) {

			SessionsService ss = new SessionsService();

			String[] sessionss = req.getParameterValues("sessions");

			Map<String, CinemaVO> map = (Map<String, CinemaVO>) getServletContext().getAttribute("cinemaMap");

			for (String string : sessionss) {

				String[] strs = string.split(";");

				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Date udate = null;

				try {
					udate = df.parse(strs[2]);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				ss.addSes(strs[0], strs[1], new java.sql.Timestamp(udate.getTime()), map.get(strs[1]).getCinema_type(),
						map.get(strs[1]).getCinema_size());

			}

			freshSessions();

			MyRequest myRequest = new MyRequest(req);

			if ((list_all.size() % 10) == 0) {

				myRequest.setMyParameter("whichPage", String.valueOf(list_all.size() / 10));

			} else {

				myRequest.setMyParameter("whichPage", String.valueOf((list_all.size() / 10) + 1));

			}

			req.getRequestDispatcher("/Back_end/sessions/listAllSessions.jsp?action=all").forward(myRequest, res);
			return;

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		long now = System.currentTimeMillis();

		if ("insert_need".equals(action)) {

			MovieInfoService ms = new MovieInfoService();
			List<MovieInfoVO> movieInfoVOList = new ArrayList<MovieInfoVO>();
			req.setAttribute("movieInfoVOList", movieInfoVOList);

			for (MovieInfoVO movieInfoVO : ms.getAll()) {

				if (movieInfoVO.getMovie_out().getTime() > now) {
					movieInfoVOList.add(movieInfoVO);
				}

			}

			req.getRequestDispatcher("/Back_end/sessions/insertSessions.jsp").forward(req, res);

		}
	}

}
