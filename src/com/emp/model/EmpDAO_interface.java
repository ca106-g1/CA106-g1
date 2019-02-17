package com.emp.model;

import java.util.List;

public interface EmpDAO_interface {
	
	public void insert (EmpVO manVO);
	public void update (EmpVO manVO);
	public void delete (String employee_no);
	public EmpVO findByPrimaryKey(String employee_no);
	public List<EmpVO> getAll();

}
