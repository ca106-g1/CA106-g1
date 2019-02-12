package jack102030;

import java.util.*;

public interface MOVIETICKET_interface {
	public void insert(MOVIETICKET_VO movieticketVO);
	public void update(MOVIETICKET_VO movieticketVO);
	public void delete(String mt_no);
	public MOVIETICKET_VO findByPrimaryKey(String mt_no);
	public List<MOVIETICKET_VO> getAll();
	
}
