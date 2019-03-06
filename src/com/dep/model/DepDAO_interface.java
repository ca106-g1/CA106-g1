package com.dep.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface DepDAO_interface {
	
	public void insert(DepVO depVO);
	public void update(DepVO depVO);
	public void delete(String deposit_change_no);
	public DepVO findByPrimaryKey(String deposit_change_no);
	public List<DepVO> getAll();

	public void insertByTicketorder(DepVO depVO, Connection con) throws SQLException;
	//訂票交易區間用，新增儲值異動
	
}
