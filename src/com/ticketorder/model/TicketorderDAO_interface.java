package com.ticketorder.model;

import java.util.*;



public interface TicketorderDAO_interface {
	public void insert(TicketorderVO ticketorderVO);
    public void update(TicketorderVO ticketorderVO);
    public void delete(String order_no);
    public TicketorderVO findByPrimaryKey(String order_no);
    public List<TicketorderVO> getAll();

}
