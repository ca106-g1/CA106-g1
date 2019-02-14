package jack102030;

import java.util.*;

public interface TICKETINFORMATION_interface {
	public void insert(TICKETINFORMATION_VO ticketinformationVO);
	public void update(TICKETINFORMATION_VO ticketinformationVO);
	public void delete(String ti_no);
	public TICKETINFORMATION_VO findByPrimaryKey(String ti_no);
	public List<TICKETINFORMATION_VO> getAll();

}
