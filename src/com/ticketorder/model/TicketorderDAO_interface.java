package com.ticketorder.model;

import java.util.*;



public interface TicketorderDAO_interface {
	public void insert(TicketorderVO ticketorderVO);
    public void update(TicketorderVO ticketorderVO);
    public void delete(String order_no);
    public TicketorderVO findByPrimaryKey(String order_no);
    public List<TicketorderVO> getAll();
    
    public void ticketsTradingInterval(String member_no, Integer order_amount, String sessions_no,
			String sessions_status, String fd_no, String[] mt_no, String[] ti_no);
	/* MemVO          member_no         會員編號
	 * TicketorderVO  order_amount      訂單金額
	 * SessionsVO     sessions_no       場次編號
	 * SessionsVO     sessions_status   座位狀態
	 * TicketorderVO  fd_no             優惠編號
	 * MovieticketVO  mt_no             座位編號
	 * MovieticketVO  ti_no             票種編號 
	 * DepVO          deposit_change_money 
	 * */

}
