package com.newsinfo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class NewsInfoJDBCDAO implements NewsInfoDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BOSS";
	String passwd = "123456";

	private static final String INSERT_STMT = 
		"INSERT INTO newsinfo (news_no, movie_no, news_title, news_auther, news_times, news_con, news_pic) VALUES (newsinfo_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT news_no, movie_no, news_title, news_auther, to_char(news_times,'yyyy-mm-dd') news_times, news_con, news_pic FROM newsinfo order by news_no";
	private static final String GET_ONE_STMT = 
		"SELECT news_no, movie_no, news_title, news_auther, to_char(news_times,'yyyy-mm-dd') news_times, news_con, news_pic FROM newsinfo where news_no = ?";
	private static final String DELETE = 
		"DELETE FROM newsinfo where news_no = ?";
	private static final String UPDATE = 
		"UPDATE newsinfo set movie_no=?, news_title=?, news_auther=?, news_times=?, news_con=?, news_pic=? where news_no = ?";

	@Override
	public void insert(NewsInfoVO newsinfoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, newsinfoVO.getMovie_no());
			pstmt.setString(2, newsinfoVO.getNews_title());
			pstmt.setString(3, newsinfoVO.getNews_auther());
			pstmt.setDate(4, newsinfoVO.getNews_times());
			pstmt.setString(5, newsinfoVO.getNews_con());
			pstmt.setBytes(6, newsinfoVO.getNews_pic());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void update(NewsInfoVO newsinfoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, newsinfoVO.getMovie_no());
			pstmt.setString(2, newsinfoVO.getNews_title());
			pstmt.setString(3, newsinfoVO.getNews_auther());
			pstmt.setDate(4, newsinfoVO.getNews_times());
			pstmt.setString(5, newsinfoVO.getNews_con());
			pstmt.setBytes(6, newsinfoVO.getNews_pic());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer news_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, news_no);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public NewsInfoVO findByPrimaryKey(Integer news_no) {

		NewsInfoVO newsinfoVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, news_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				newsinfoVO = new NewsInfoVO();
				
				newsinfoVO.setNews_no(rs.getInt("news_no"));
				newsinfoVO.setMovie_no(rs.getInt("movie_no"));
				newsinfoVO.setNews_title(rs.getString("news_title"));
				newsinfoVO.setNews_auther(rs.getString("news_auther"));
				newsinfoVO.setNews_times(rs.getDate("news_times"));
				newsinfoVO.setNews_con(rs.getString("news_con"));
				newsinfoVO.setNews_pic(rs.getBytes("news_pic"));
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
		return newsinfoVO;
	}
	
	@Override
	public List<NewsInfoVO> getAll() {
		List<NewsInfoVO> list = new ArrayList<NewsInfoVO>();
		NewsInfoVO newsinfoVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				newsinfoVO = new NewsInfoVO();
				
				newsinfoVO.setNews_no(rs.getInt("news_no"));
				newsinfoVO.setMovie_no(rs.getInt("movie_no"));
				newsinfoVO.setNews_title(rs.getString("news_title"));
				newsinfoVO.setNews_auther(rs.getString("news_auther"));
				newsinfoVO.setNews_times(rs.getDate("news_times"));
				newsinfoVO.setNews_con(rs.getString("news_con"));
				newsinfoVO.setNews_pic(rs.getBytes("news_pic"));
				list.add(newsinfoVO); 
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
	
	public static void mian(String[]args) {
		NewsInfoJDBCDAO dao = new NewsInfoJDBCDAO();
		
		//測試
		NewsInfoVO newsinfoVO1 = new NewsInfoVO();
		
		//新增
		newsinfoVO1.setMovie_no(2);
		newsinfoVO1.setNews_title("標題新增測試");
		newsinfoVO1.setNews_auther("作者新增測試");
//		newsinfoVO1.setNews_times();
		newsinfoVO1.setNews_con("內文新增測試");
//		newsinfoVO1.setNews_pic();
		
		
		
		//修改
		
		
		//刪除
		
		
		//單一查詢
		
		
		//多項查詢
		
	}

}
