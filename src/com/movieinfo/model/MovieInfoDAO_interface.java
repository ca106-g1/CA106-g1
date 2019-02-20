package com.movieinfo.model;

import java.util.*;

public interface MovieInfoDAO_interface {
	public void insert(MovieInfoVO movieinfoVO);
	public void update(MovieInfoVO movieinfoVO);
    public void delete(Integer movieinfo_no);
    public MovieInfoVO findByPrimaryKey(Integer movieimfo_no);
    public List<MovieInfoVO> getAll();

}
