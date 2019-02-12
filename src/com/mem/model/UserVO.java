package com.mem.model;


import java.sql.Date;

import oracle.sql.BLOB;



public class UserVO implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String  MEMBER_NO ;
	private String  MEMBER_ACCOUNT ;
	private String  MEMBER_PASSWORD ;
	private String  MEMBER_NAME ;
	private String  MEMBER_NICK ;
	private Integer MEMBER_SEX ;
	private Date    MEMBER_BIRTHDAY ; 
	private String  MEMBER_ADDRESS ;
	private String  MEMBER_EMAIL ;
	private BLOB  MEMBER_PICTURE ;
	private String MEMBER_CREDIT_NUMBER;
	private Integer MEMBER_BACK_VERIFICATION;


	
	
	public String getMEMBER_NO() {
		return MEMBER_NO;
	}
	public void setMEMBER_NO(String MEMBER_NO) {
		this.MEMBER_NO = MEMBER_NO;
	}
	public String getMEMBER_ACCOUNT() {
		return MEMBER_ACCOUNT;
	}
	public void setMEMBER_ACCOUNT(String MEMBER_ACCOUNT) {
		this.MEMBER_ACCOUNT = MEMBER_ACCOUNT;
	}
	public String getMEMBER_PASSWORD() {
		return MEMBER_PASSWORD;
	}
	public void setMEMBER_PASSWORD(String MEMBER_PASSWORD) {
		this.MEMBER_PASSWORD = MEMBER_PASSWORD;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String MEMBER_NAME) {
		this.MEMBER_NAME = MEMBER_NAME;
	}
	public String getMEMBER_NICK() {
		return MEMBER_NICK;
	}
	public void setMEMBER_NICK(String MEMBER_NICK) {
		this.MEMBER_NICK = MEMBER_NICK;
	}
	public Integer getMEMBER_SEX() {
		return MEMBER_SEX;
	}
	public void setMEMBER_SEX(Integer MEMBER_SEX) {
		this.MEMBER_SEX = MEMBER_SEX;
	}
	public Date getMEMBER_BIRTHDAY() {
		return MEMBER_BIRTHDAY;
	}
	public void setMEMBER_BIRTHDAY(Date MEMBER_BIRTHDAY) {
		this.MEMBER_BIRTHDAY = MEMBER_BIRTHDAY;
	}
	public String getMEMBER_ADDRESS() {
		return MEMBER_ADDRESS;
	}
	public void setMEMBER_ADDRESS(String MEMBER_ADDRESS) {
		this.MEMBER_ADDRESS = MEMBER_ADDRESS;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String MEMBER_EMAIL) {
		this.MEMBER_EMAIL = MEMBER_EMAIL;
	}
	public BLOB getMEMBER_PICTURE() {
		return MEMBER_PICTURE;
	}
	public void setMEMBER_PICTURE(BLOB MEMBER_PICTURE) {
		this.MEMBER_PICTURE = MEMBER_PICTURE;
	}
	public String getMEMBER_CREDIT_NUMBER() {
		return MEMBER_CREDIT_NUMBER;
	}
	public void setMEMBER_CREDIT_NUMBER(String MEMBER_CREDIT_NUMBER) {
		this.MEMBER_CREDIT_NUMBER = MEMBER_CREDIT_NUMBER;
	}
	public Integer getMEMBER_BACK_VERIFICATION() {
		return MEMBER_BACK_VERIFICATION;
	}
	public void setMEMBER_BACK_VERIFICATION(Integer MEMBER_BACK_VERIFICATION) {
		this.MEMBER_BACK_VERIFICATION = MEMBER_BACK_VERIFICATION;
	}
	
	
	

}
