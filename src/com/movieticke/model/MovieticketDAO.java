package com.movieticke.model;

import java.util.*;

import java.sql.*;

public class MovieticketDAO implements MovieticketDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA106";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO MOVIETICKET (mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share) VALUES (MOVIETICKET_seq.NEXTVAL, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share FROM MOVIETICKET order by mt_no";
	private static final String GET_ONE_STMT = 
			"SELECT mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share FROM MOVIETICKET where mt_no = ?";
	private static final String DELETE = 
			"DELETE FROM MOVIETICKET where mt_no = ?";
	private static final String UPDATE = 
			"UPDATE MOVIETICKET set order_no=?, ti_no=?, mt_qr=?, mt_admission=?, mt_share=? where mt_no = ?";
	
	@Override
	public void insert(MovieticketVO movieticketVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			//pstmt.setString(1, ticketorderVO.getOrder_no());
			pstmt.setString(1, movieticketVO.getOrder_no());
			pstmt.setString(2, movieticketVO.getTi_no());
			pstmt.setBytes(3, movieticketVO.getMt_qr());
			pstmt.setInt(4, movieticketVO.getMt_admission());
			pstmt.setString(5, movieticketVO.getMt_share());
			
			

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
	public void update(MovieticketVO movieticketVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			
//			pstmt.setString(1, movieticketVO.getMt_no());
			pstmt.setString(1, movieticketVO.getOrder_no());
			pstmt.setString(2, movieticketVO.getTi_no());
			pstmt.setBytes(3, movieticketVO.getMt_qr());
			pstmt.setInt(4, movieticketVO.getMt_admission());
			pstmt.setString(5, movieticketVO.getMt_share());
			pstmt.setString(6, movieticketVO.getMt_no());
			
//			"UPDATE MOVIETICKET set order_no=?, ti_no=?, mt_qr=?, mt_admission=?, mt_share=? where mt_no = ?";

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
	public void delete(String mt_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mt_no);

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
	public MovieticketVO findByPrimaryKey(String mt_no) {
		MovieticketVO movieticketVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mt_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				movieticketVO = new MovieticketVO();
				movieticketVO.setMt_no(rs.getString("mt_no"));
				movieticketVO.setOrder_no(rs.getString("order_no"));
				movieticketVO.setTi_no(rs.getString("ti_no"));
				movieticketVO.setMt_qr(rs.getBytes("mt_qr"));
				movieticketVO.setMt_admission(rs.getInt("mt_admission"));
				movieticketVO.setMt_share(rs.getString("mt_share"));
			}

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
		
		return movieticketVO;
	}

	@Override
	public List<MovieticketVO> getAll() {
		List<MovieticketVO> list = new ArrayList<MovieticketVO>();
		MovieticketVO movieticketVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				movieticketVO = new MovieticketVO();
				movieticketVO.setMt_no(rs.getString("mt_no"));
				movieticketVO.setOrder_no(rs.getString("order_no"));
				movieticketVO.setTi_no(rs.getString("ti_no"));
				movieticketVO.setMt_qr(rs.getBytes("mt_qr"));
				movieticketVO.setMt_admission(rs.getInt("mt_admission"));
				movieticketVO.setMt_share(rs.getString("mt_share"));
				list.add(movieticketVO); // Store the row in the list
			}

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
	
	public static void main(String[] args) {

		MovieticketDAO dao = new MovieticketDAO();

		// 新增
		MovieticketVO movieticketVO1 = new MovieticketVO();
		movieticketVO1.setOrder_no("2");
		movieticketVO1.setTi_no("22");
		movieticketVO1.setMt_qr(null);
		movieticketVO1.setMt_admission(0);
		movieticketVO1.setMt_share("qewr520@gmail.com");
		dao.insert(movieticketVO1);

		// 修改
		MovieticketVO movieticketVO2 = new MovieticketVO();
		movieticketVO2.setMt_no("1");
		movieticketVO2.setOrder_no("1");
		movieticketVO2.setTi_no("23");
		movieticketVO2.setMt_qr(null);
		movieticketVO2.setMt_admission(1);
		movieticketVO2.setMt_share("zxcv520@gmail.com");
		dao.update(movieticketVO2);

		// 刪除
		dao.delete("16");

		// 查詢
		MovieticketVO movieticketVO3 = dao.findByPrimaryKey("1");
		System.out.print(movieticketVO3.getMt_no() + ",");
		System.out.print(movieticketVO3.getOrder_no() + ",");
		System.out.print(movieticketVO3.getTi_no() + ",");
		System.out.print(movieticketVO3.getMt_qr() + ",");
		System.out.print(movieticketVO3.getMt_admission() + ",");
		System.out.println(movieticketVO3.getMt_share());
		System.out.println("---------------------");

		// 查詢
		List<MovieticketVO> list = dao.getAll();
		for (MovieticketVO movieticketVO4 : list) {
			System.out.print(movieticketVO4.getMt_no() + ",");
			System.out.print(movieticketVO4.getOrder_no() + ",");
			System.out.print(movieticketVO4.getTi_no() + ",");
			System.out.print(movieticketVO4.getMt_qr() + ",");
			System.out.print(movieticketVO4.getMt_admission() + ",");
			System.out.print(movieticketVO4.getMt_share());
			System.out.println();
		}
	}

	
	
	
	

}
