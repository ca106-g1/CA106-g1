package com.dep.model;

import java.util.List;

public class DepService {
	
	private DepDAO_interface dao;
	
	public DepService() {
		dao = new DepDAOImpl();
	}
	
	public DepVO addDep( String deposit_member_no,Integer deposit_change_money,java.sql.Date deposit_change_date) {
		
		DepVO depVO = new DepVO();
		
		depVO.setDeposit_member_no(deposit_member_no);
		depVO.setDeposit_change_money(deposit_change_money);
		depVO.setDeposit_change_date(deposit_change_date);
		dao.insert(depVO);
		
		
		return depVO;
		
	}
	
	public DepVO updateEmp( String deposit_change_no,String deposit_member_no,Integer deposit_change_money,java.sql.Date deposit_change_date) {
		
		DepVO depVO = new DepVO();
		
		depVO.setDeposit_change_no(deposit_change_no);
		depVO.setDeposit_member_no(deposit_member_no);
		depVO.setDeposit_change_money(deposit_change_money);
		depVO.setDeposit_change_date(deposit_change_date);
		
		dao.update(depVO);
		
		return depVO;
		
	}
	
	public void deleteDep(String deposit_change_no) {
		dao.delete(deposit_change_no);
	}
	
	public DepVO getoneDep(String deposit_change_no) {
		
		return dao.findByPrimaryKey(deposit_change_no);
		
	}
	
	public List<DepVO> getAll(){
		
		return dao.getAll();
		
	}

}
