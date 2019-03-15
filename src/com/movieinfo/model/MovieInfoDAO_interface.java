package com.movieinfo.model;

import java.util.*;

public interface MovieInfoDAO_interface {
	public void insert(MovieInfoVO movieinfoVO);
	public void update(MovieInfoVO movieinfoVO);
    public void delete(String movie_no);
    public MovieInfoVO findByPrimaryKey(String movie_no);
    public List<MovieInfoVO> getAll();

}
