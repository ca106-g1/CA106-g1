package com.newsinfo.model;

import java.util.*;

public interface NewsInfoDAO_interface {
	public void insert(NewsInfoVO newsinfoVO);
	public void update(NewsInfoVO newsinfoVO);
	public void delete(Integer newsinfo_no);
	public NewsInfoVO findByPrimaryKey(Integer newsinfo_no);
	public List<NewsInfoVO> getAll();
}
