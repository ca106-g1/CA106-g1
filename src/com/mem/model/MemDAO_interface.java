package com.mem.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface MemDAO_interface {
	
	public void insert (MemVO memVO);
	public void update(MemVO memVO);
	public void delete (String member_no);
	public  MemVO findByPrimaryKey(String member_no);
	public  MemVO findByMember_account(String member_account);
	public List<MemVO> getAll();

	public void updateMember_point(MemVO memVO, Connection con, Integer order_amount) throws SQLException;
	//訂票交易區間用，更新點數
}
