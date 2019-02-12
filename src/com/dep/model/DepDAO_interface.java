package com.dep.model;

import java.util.List;

public interface DepDAO_interface {
	//111
	public void insert(DepVO depVO);
	public void update(DepVO depVO);
	public void delete(String DEPOSIT_CHANGE_NO);
	public DepVO findByPrimaryKey(String DEPOSIT_CHANGE_NO);
	public List<DepVO> getAll();

}
