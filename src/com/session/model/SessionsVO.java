package com.session.model;

import java.io.Serializable;
import java.sql.Date;

public class SessionsVO implements Serializable{

	private static final long serialVersionUID = -6332296927066906614L;

	private String sessions_no;
	private Integer movie_no;
	private String cinema_no;
	private Date sessions_start;
	private String sessions_status;
	private Integer sessions_remaining;
	
	
	public String getSessions_no() {
		return sessions_no;
	}
	public void setSessions_no(String sessions_no) {
		this.sessions_no = sessions_no;
	}
	public Integer getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(Integer movie_no) {
		this.movie_no = movie_no;
	}
	public String getCinema_no() {
		return cinema_no;
	}
	public void setCinema_no(String cinema_no) {
		this.cinema_no = cinema_no;
	}
	public Date getSessions_start() {
		return sessions_start;
	}
	public void setSessions_start(Date sessions_start) {
		this.sessions_start = sessions_start;
	}
	public String getSessions_status() {
		return sessions_status;
	}
	public void setSessions_status(String sessions_status) {
		this.sessions_status = sessions_status;
	}
	public Integer getSessions_remaining() {
		return sessions_remaining;
	}
	public void setSessions_remaining(Integer sessions_remaining) {
		this.sessions_remaining = sessions_remaining;
	}	
	
}
