package jack102030;

import java.util.*;


import java.sql.*;

public class TICKETORDER_DAO implements TICKETORDER_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA106";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO TICKETORDER (order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,order_time,order_amount) VALUES (TICKETORDER_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,to_char(order_time,'yyyy-mm-dd') order_time,order_amount FROM TICKETORDER order by order_no";
	private static final String GET_ONE_STMT = 
			"SELECT order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,to_char(order_time,'yyyy-mm-dd') order_time,order_amount FROM TICKETORDER where order_no = ?";
	private static final String DELETE = 
			"DELETE FROM TICKETORDER where order_no = ?";
	private static final String UPDATE = 
			"UPDATE TICKETORDER set member_no=?, fd_no=?, session_no=?, employee_no=?, order_group=?, order_takemeals=?, order_time=?, order_amount=? where order_no = ?";

	@Override
	public void insert(TICKETORDER_VO ticketorderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			//pstmt.setString(1, ticketorderVO.getOrder_no());
			pstmt.setString(1, ticketorderVO.getMember_no());
			pstmt.setString(2, ticketorderVO.getFd_no());
			pstmt.setString(3, ticketorderVO.getSession_no());
			pstmt.setString(4, ticketorderVO.getEmployee_no());
			pstmt.setInt(5, ticketorderVO.getOrder_group());
			pstmt.setInt(6, ticketorderVO.getOrder_takemeals());
			pstmt.setDate(7, ticketorderVO.getOrder_time());
			pstmt.setInt(8, ticketorderVO.getOrder_amount());
			

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
	public void update(TICKETORDER_VO ticketorderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, ticketorderVO.getMember_no());
			pstmt.setString(2, ticketorderVO.getFd_no());
			pstmt.setString(3, ticketorderVO.getSession_no());
			pstmt.setString(4, ticketorderVO.getEmployee_no());
			pstmt.setInt(5, ticketorderVO.getOrder_group());
			pstmt.setInt(6, ticketorderVO.getOrder_takemeals());
			pstmt.setDate(7, ticketorderVO.getOrder_time());
			pstmt.setInt(8, ticketorderVO.getOrder_amount());
			pstmt.setString(9, ticketorderVO.getOrder_no());
			

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
	public void delete(String order_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_no);

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
	public TICKETORDER_VO findByPrimaryKey(String order_no) {
		TICKETORDER_VO ticketorderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				ticketorderVO = new TICKETORDER_VO();
				ticketorderVO.setOrder_no(rs.getString("order_no"));
				ticketorderVO.setMember_no(rs.getString("member_no"));
				ticketorderVO.setFd_no(rs.getString("fd_no"));
				ticketorderVO.setSession_no(rs.getString("session_no"));
				ticketorderVO.setEmployee_no(rs.getString("employee_no"));
				ticketorderVO.setOrder_group(rs.getInt("order_group"));
				ticketorderVO.setOrder_takemeals(rs.getInt("order_takemeals"));
				ticketorderVO.setOrder_time(rs.getDate("order_time"));
				ticketorderVO.setOrder_amount(rs.getInt("order_amount"));
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
		
		return ticketorderVO;
	}

	@Override
	public List<TICKETORDER_VO> getAll() {
		List<TICKETORDER_VO> list = new ArrayList<TICKETORDER_VO>();
		TICKETORDER_VO ticketorderVO = null;

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
				ticketorderVO = new TICKETORDER_VO();
				ticketorderVO.setOrder_no(rs.getString("order_no"));
				ticketorderVO.setMember_no(rs.getString("member_no"));
				ticketorderVO.setFd_no(rs.getString("fd_no"));
				ticketorderVO.setSession_no(rs.getString("session_no"));
				ticketorderVO.setEmployee_no(rs.getString("employee_no"));
				ticketorderVO.setOrder_group(rs.getInt("order_group"));
				ticketorderVO.setOrder_takemeals(rs.getInt("order_takemeals"));
				ticketorderVO.setOrder_time(rs.getDate("order_time"));
				ticketorderVO.setOrder_amount(rs.getInt("order_amount"));
				list.add(ticketorderVO); // Store the row in the list
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

		TICKETORDER_DAO dao = new TICKETORDER_DAO();

		// 新增
		TICKETORDER_VO ticketorderVO1 = new TICKETORDER_VO();
		ticketorderVO1.setMember_no("16");
		ticketorderVO1.setFd_no("22");
		ticketorderVO1.setSession_no("122");
		ticketorderVO1.setEmployee_no("0022");
		ticketorderVO1.setOrder_group(1);
		ticketorderVO1.setOrder_takemeals(1);
		ticketorderVO1.setOrder_time(java.sql.Date.valueOf("2005-01-01"));
		ticketorderVO1.setOrder_amount(500);
		dao.insert(ticketorderVO1);

		// 修改
		TICKETORDER_VO ticketorderVO2 = new TICKETORDER_VO();
		ticketorderVO2.setOrder_no("1");
		ticketorderVO2.setMember_no("10023");
		ticketorderVO2.setFd_no("23");
		ticketorderVO2.setSession_no("123");
		ticketorderVO2.setEmployee_no("0023");
		ticketorderVO2.setOrder_group(0);
		ticketorderVO2.setOrder_takemeals(0);
		ticketorderVO2.setOrder_time(java.sql.Date.valueOf("2005-03-03"));
		ticketorderVO2.setOrder_amount(503);
		dao.update(ticketorderVO2);

		// 刪除
		dao.delete("16");

		// 查詢
		TICKETORDER_VO ticketorderVO3 = dao.findByPrimaryKey("1");
		System.out.print(ticketorderVO3.getOrder_no() + ",");
		System.out.print(ticketorderVO3.getMember_no() + ",");
		System.out.print(ticketorderVO3.getFd_no() + ",");
		System.out.print(ticketorderVO3.getSession_no() + ",");
		System.out.print(ticketorderVO3.getEmployee_no() + ",");
		System.out.print(ticketorderVO3.getOrder_group() + ",");
		System.out.print(ticketorderVO3.getOrder_takemeals() + ",");
		System.out.print(ticketorderVO3.getOrder_time() + ",");
		System.out.println(ticketorderVO3.getOrder_amount());
		System.out.println("---------------------");

		// 查詢
		List<TICKETORDER_VO> list = dao.getAll();
		for (TICKETORDER_VO ticketorderVO4 : list) {
			System.out.print(ticketorderVO4.getOrder_no() + ",");
			System.out.print(ticketorderVO4.getMember_no() + ",");
			System.out.print(ticketorderVO4.getFd_no() + ",");
			System.out.print(ticketorderVO4.getSession_no() + ",");
			System.out.print(ticketorderVO4.getEmployee_no() + ",");
			System.out.print(ticketorderVO4.getOrder_group() + ",");
			System.out.print(ticketorderVO4.getOrder_takemeals() + ",");
			System.out.print(ticketorderVO4.getOrder_time() + ",");
			System.out.print(ticketorderVO4.getOrder_amount());
			System.out.println();
		}
	}
		
				
	
	

}
