package com.movieticke.model;

import java.util.*;

public interface MovieticketDAO_interface {
	public void insert(MovieticketVO movieticketVO);
	public void update(MovieticketVO movieticketVO);
	public void delete(String mt_no);
	public MovieticketVO findByPrimaryKey(String mt_no);
	public List<MovieticketVO> getAll();
	
}
