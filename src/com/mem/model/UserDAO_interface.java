package com.mem.model;

import java.util.List;

public interface UserDAO_interface {
	
	public void insert (UserVO userVO);
	public void update(UserVO userVO);
	public void delete (String MEMBER_NO);
	public  UserVO findByPrimaryKey(String MEMBER_NO);
	public List<UserVO> getAll();
	

}
