package com.movieinfo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MovieInfoJDBCDAO implements MovieInfoDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BOSS";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
		"INSERT INTO movieinfo (movie_no, genre_no, movie_name, movie_level, director, movie_cast, movie_intro, movie_length, movie_trailer, movie_pic, movie_in, movie_out, movie_count, movie_exp, movie_noexp, movie_touch, movie_ticket) VALUES (movieinfo_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT movie_no, genre_no, movie_name, movie_level, director, movie_cast, movie_intro, movie_length, movie_trailer, movie_pic, to_char(movie_in,'yyyy-mm-dd') movie_in, to_char(movie_out,'yyyy-mm-dd') movie_out, movie_count, movie_exp, movie_noexp, movie_touch, movie_ticket FROM movieinfo order by movie_no";
	private static final String GET_ONE_STMT = 
		"SELECT movie_no, genre_no, movie_name, movie_level, director, movie_cast, movie_intro, movie_length, movie_trailer, movie_pic, to_char(movie_in,'yyyy-mm-dd') movie_in, to_char(movie_out,'yyyy-mm-dd') movie_out, movie_count, movie_exp, movie_noexp, movie_touch, movie_ticket FROM movieinfo where movie_no = ?";
	private static final String DELETE = 
		"DELETE FROM movieinfo where movie_no = ?";
	private static final String UPDATE = 
		"UPDATE movieinfo set genre_no=?, movie_name=?, movie_level=?, director=?, movie_cast=?, movie_intro=?, movie_length=?, movie_trailer=?, movie_pic=?, movie_in=?, movie_out=?, movie_count=?, movie_exp=?, movie_noexp=?, movie_touch=?, movie_ticket=? where movie_no = ?";

	
	@Override
	public void insert(MovieInfoVO movieinfoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, movieinfoVO.getGenre_no());
			pstmt.setString(2, movieinfoVO.getMovie_name());
			pstmt.setBytes(3, movieinfoVO.getMovie_level());
			pstmt.setString(4, movieinfoVO.getDirector());
			pstmt.setString(5, movieinfoVO.getMovie_cast());
			pstmt.setString(6, movieinfoVO.getMovie_intro());
			pstmt.setString(7, movieinfoVO.getMovie_length());
			pstmt.setBytes(8, movieinfoVO.getMovie_trailer());
			pstmt.setBytes(9, movieinfoVO.getMovie_pic());
			pstmt.setDate(10, movieinfoVO.getMovie_in());
			pstmt.setDate(11, movieinfoVO.getMovie_out());
			pstmt.setInt(12, movieinfoVO.getMovie_count());
			pstmt.setInt(13, movieinfoVO.getMovie_exp());
			pstmt.setInt(14, movieinfoVO.getMovie_noexp());
			pstmt.setInt(15, movieinfoVO.getMovie_touch());
			pstmt.setInt(16, movieinfoVO.getMovie_ticket());

			pstmt.executeUpdate();

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	@Override
	public void update(MovieInfoVO movieinfoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, movieinfoVO.getGenre_no());
			pstmt.setString(2, movieinfoVO.getMovie_name());
			pstmt.setBytes(3, movieinfoVO.getMovie_level());
			pstmt.setString(4, movieinfoVO.getDirector());
			pstmt.setString(5, movieinfoVO.getMovie_cast());
			pstmt.setString(6, movieinfoVO.getMovie_intro());
			pstmt.setString(7, movieinfoVO.getMovie_length());
			pstmt.setBytes(8, movieinfoVO.getMovie_trailer());
			pstmt.setBytes(9, movieinfoVO.getMovie_pic());
			pstmt.setDate(10, movieinfoVO.getMovie_in());
			pstmt.setDate(11, movieinfoVO.getMovie_out());
			pstmt.setInt(12, movieinfoVO.getMovie_count());
			pstmt.setInt(13, movieinfoVO.getMovie_exp());
			pstmt.setInt(14, movieinfoVO.getMovie_noexp());
			pstmt.setInt(15, movieinfoVO.getMovie_touch());
			pstmt.setInt(16, movieinfoVO.getMovie_ticket());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	@Override
	public void delete(Integer movie_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, movie_no);

			pstmt.executeUpdate();

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	@Override
	public MovieInfoVO findByPrimaryKey(Integer movie_no) {

		MovieInfoVO movieinfoVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, movie_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				movieinfoVO = new MovieInfoVO();

				movieinfoVO.setMovie_no(rs.getInt("movie_no"));
				movieinfoVO.setGenre_no(rs.getInt("genre_no"));
				movieinfoVO.setMovie_name(rs.getString("movie_name"));
				movieinfoVO.setMovie_level(rs.getBytes("movie_level"));
				movieinfoVO.setDirector(rs.getString("director"));
				movieinfoVO.setMovie_cast(rs.getString("movie_cast"));
				movieinfoVO.setMovie_intro(rs.getString("movie_intro"));
				movieinfoVO.setMovie_length(rs.getString("movie_length"));
				movieinfoVO.setMovie_trailer(rs.getBytes("movie_trailer"));
				movieinfoVO.setMovie_pic(rs.getBytes("genre_pic"));
				movieinfoVO.setMovie_in(rs.getDate("movie_in"));
				movieinfoVO.setMovie_out(rs.getDate("movie_out"));
				movieinfoVO.setMovie_count(rs.getInt("movie_count"));
				movieinfoVO.setMovie_exp(rs.getInt("movie_exp"));
				movieinfoVO.setMovie_noexp(rs.getInt("movie_noexp"));
				movieinfoVO.setMovie_touch(rs.getInt("movie_touth"));
				movieinfoVO.setMovie_ticket(rs.getInt("movie_ticket"));
			}

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return movieinfoVO;
	}
	
	@Override
	public List<MovieInfoVO> getAll() {
		List<MovieInfoVO> list = new ArrayList<MovieInfoVO>();
		MovieInfoVO movieinfoVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				movieinfoVO = new MovieInfoVO();

				movieinfoVO.setMovie_no(rs.getInt("movie_no"));
				movieinfoVO.setGenre_no(rs.getInt("genre_no"));
				movieinfoVO.setMovie_name(rs.getString("movie_name"));
				movieinfoVO.setMovie_level(rs.getBytes("movie_level"));
				movieinfoVO.setDirector(rs.getString("director"));
				movieinfoVO.setMovie_cast(rs.getString("movie_cast"));
				movieinfoVO.setMovie_intro(rs.getString("movie_intro"));
				movieinfoVO.setMovie_length(rs.getString("movie_length"));
				movieinfoVO.setMovie_trailer(rs.getBytes("movie_trailer"));
				movieinfoVO.setMovie_pic(rs.getBytes("genre_pic"));
				movieinfoVO.setMovie_in(rs.getDate("movie_in"));
				movieinfoVO.setMovie_out(rs.getDate("movie_out"));
				movieinfoVO.setMovie_count(rs.getInt("movie_count"));
				movieinfoVO.setMovie_exp(rs.getInt("movie_exp"));
				movieinfoVO.setMovie_noexp(rs.getInt("movie_noexp"));
				movieinfoVO.setMovie_touch(rs.getInt("movie_touth"));
				movieinfoVO.setMovie_ticket(rs.getInt("movie_ticket"));

				list.add(movieinfoVO);
			}

			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}


}
