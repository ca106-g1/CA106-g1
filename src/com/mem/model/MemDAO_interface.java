package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	
	public void insert (MemVO memVO);
	public void update(MemVO memVO);
	public void delete (String member_no);
	public  MemVO findByPrimaryKey(String member_no);
	public  MemVO findByMember_account(String member_account);
	public List<MemVO> getAll();
	

}
