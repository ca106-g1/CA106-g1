package com.dep.model;

import java.sql.Date;

public class DepVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String DEPOSIT_CHANGE_NO;
	private String DEPOSIT_MEMBER_NO;
	private Integer DEPOSIT_CHANGE_MONEY;
	private Date DEPOSIT_CHANGE_DATE;
	
	public String getDEPOSIT_CHANGE_NO() {
		return DEPOSIT_CHANGE_NO;
	}
	public void setDEPOSIT_CHANGE_NO(String DEPOSIT_CHANGE_NO) {
		this.DEPOSIT_CHANGE_NO = DEPOSIT_CHANGE_NO;
	}
	public String getDEPOSIT_MEMBER_NO() {
		return DEPOSIT_MEMBER_NO;
	}
	public void setDEPOSIT_MEMBER_NO(String DEPOSIT_MEMBER_NO) {
		this.DEPOSIT_MEMBER_NO = DEPOSIT_MEMBER_NO;
	}
	public Integer getDEPOSIT_CHANGE_MONEY() {
		return DEPOSIT_CHANGE_MONEY;
	}
	public void setDEPOSIT_CHANGE_MONEY(Integer DEPOSIT_CHANGE_MONEY) {
		this.DEPOSIT_CHANGE_MONEY = DEPOSIT_CHANGE_MONEY;
	}
	public Date getDEPOSIT_CHANGE_DATE() {
		return DEPOSIT_CHANGE_DATE;
	}
	public void setDEPOSIT_CHANGE_DATE(Date DEPOSIT_CHANGE_DATE) {
		this.DEPOSIT_CHANGE_DATE = DEPOSIT_CHANGE_DATE;
	}
	

	
	
}
