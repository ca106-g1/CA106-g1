package jack102030;

import java.util.*;



public interface TICKETORDER_interface {
	public void insert(TICKETORDER_VO ticketorderVO);
    public void update(TICKETORDER_VO ticketorderVO);
    public void delete(String order_no);
    public TICKETORDER_VO findByPrimaryKey(String order_no);
    public List<TICKETORDER_VO> getAll();

}
