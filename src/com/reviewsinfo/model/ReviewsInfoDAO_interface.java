package com.reviewsinfo.model;

import java.util.*; 

public interface ReviewsInfoDAO_interface {
	public void insert(ReviewsInfoVO reviewsinfoVO);
	public void update(ReviewsInfoVO reviewsinfoVO);
	public void delete(Integer reviewsinfo_no);
	public ReviewsInfoVO findByPrimaryKey(Integer reviewsinfo_op);
	public List<ReviewsInfoVO> getAll();
	

}
