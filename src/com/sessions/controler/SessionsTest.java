package com.sessions.controler;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sessions.model.*;

@WebServlet("/SessionsTest")
public class SessionsTest extends HttpServlet{
	private static final long serialVersionUID = -6033860866001943359L;
	
	private SessionsDAOImpl sessionsDAOImpl;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SessionsVO sessionsVO = new SessionsVO();
		sessionsVO.setMovie_no(999);
		sessionsVO.setCinema_no("CINEMA001");
		sessionsVO.setSessions_start(new java.sql.Date(new GregorianCalendar().getTime().getTime()));
		sessionsVO.setSessions_status("JNDI´ú¸Õinsert");
		sessionsVO.setSessions_remaining(400);
		
		sessionsDAOImpl.insert(sessionsVO);
		
		SessionsVO sessionsVO2 = new SessionsVO();
		sessionsVO2.setSessions_no("SESSIONS00000019");
		sessionsVO2.setMovie_no(999);
		sessionsVO2.setCinema_no("CINEMA001");
		sessionsVO2.setSessions_start(new java.sql.Date(new GregorianCalendar().getTime().getTime()));
		sessionsVO2.setSessions_status("JNDI´ú¸Õupdate");
		sessionsVO2.setSessions_remaining(400);
		
		sessionsDAOImpl.update(sessionsVO2);
		
		sessionsDAOImpl.delete("SESSIONS00000017");
		
		System.out.println(sessionsDAOImpl.findByPrimaryKey("SESSIONS00000020"));
		System.out.println(sessionsDAOImpl.getAll());
		
	}

	@Override
	public void init() throws ServletException {
		sessionsDAOImpl = new SessionsDAOImpl();
	}
	
	

}
