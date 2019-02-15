package com.adv.model;

import java.sql.Blob;
import java.sql.Date;

public class AdvVO implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -484289920823447586L;
	private String ad_no;			
	private String ad_name;			
	private Blob   ad_pic;
	private String ad_cont;	
	private Date   ad_start;				
	private Date   ad_end;
	
	
	public String getAd_no() {
		return ad_no;
	}
	public void setAd_no(String ad_no) {
		this.ad_no = ad_no;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public Blob getAd_pic() {
		return ad_pic;
	}
	public void setAd_pic(Blob ad_pic) {
		this.ad_pic = ad_pic;
	}
	public String getAd_cont() {
		return ad_cont;
	}
	public void setAd_cont(String ad_cont) {
		this.ad_cont = ad_cont;
	}
	public Date getAd_start() {
		return ad_start;
	}
	public void setAd_start(Date ad_start) {
		this.ad_start = ad_start;
	}
	public Date getAd_end() {
		return ad_end;
	}
	public void setAd_end(Date ad_end) {
		this.ad_end = ad_end;
	}

	

}
