package com.moviegenre.model;

import java.util.*;

public interface MovieGenreDAO_interface {
	public void insert(MovieGenreVO moviegenreVO);
	public void update(MovieGenreVO moviegenreVO);
    public void delete(Integer moviegenre_no);
    public MovieGenreVO findByPrimaryKey(Integer moviegenre_no);
    public List<MovieGenreVO> getAll();

}
