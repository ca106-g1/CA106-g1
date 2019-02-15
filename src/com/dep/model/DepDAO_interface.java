package com.dep.model;

import java.util.List;

public interface DepDAO_interface {
	//111
	public void insert(DepVO depVO);
	public void update(DepVO depVO);
	public void delete(String deposit_change_no);
	public DepVO findByPrimaryKey(String deposit_change_no);
	public List<DepVO> getAll();

}
