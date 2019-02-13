package com.session.model;

import java.util.List;

public interface SessionsDAO_interface{
	public void insert(SessionsVO sessionsVO);
    public void update(SessionsVO sessionsVO);
    public void delete(String sessions_no);
    public SessionsVO findByPrimaryKey(String sessions_no);
    public List<SessionsVO> getAll();
}
