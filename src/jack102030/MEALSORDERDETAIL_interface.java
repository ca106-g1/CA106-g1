package jack102030;

import java.util.*;

public interface MEALSORDERDETAIL_interface {
	public void insert(MEALSORDERDETAIL_VO mealsorderdetailVO);
	public void update(MEALSORDERDETAIL_VO mealsorderdetailVO);
	public void delete(String order_no);
	public MEALSORDERDETAIL_VO findByPrimaryKey(String order_no);
	public List<MEALSORDERDETAIL_VO> getAll();
	
	
	

}
