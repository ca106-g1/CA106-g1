package com.ticketorder.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class TicketorderDAO implements TicketorderDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/JOIN");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT_STMT = 
			"INSERT INTO TICKETORDER (order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,order_time,order_amount) VALUES ('TO_'||LPAD(TICKETORDER_seq.NEXTVAL,6,'0'), ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,to_char(order_time,'yyyy-mm-dd') order_time,order_amount FROM TICKETORDER order by order_no";
	private static final String GET_ONE_STMT = 
			"SELECT order_no,member_no,fd_no,session_no,employee_no,order_group,order_takemeals,to_char(order_time,'yyyy-mm-dd') order_time,order_amount FROM TICKETORDER where order_no = ?";
	private static final String DELETE = 
			"DELETE FROM TICKETORDER where order_no = ?";
	private static final String UPDATE = 
			"UPDATE TICKETORDER set member_no=?, fd_no=?, session_no=?, employee_no=?, order_group=?, order_takemeals=?, order_time=?, order_amount=? where order_no = ?";
	
	
	
	
	//交易區間專用指令--開始
	
	private static final String update_member_point = 
	"UPDATE MEMBER SET MEMBER_POINT = ((SELECT MEMBER_POINT FROM MEMBER WHERE MEMBER_NO = ?)+?) WHERE MEMBER_NO = ?";
	//MEMBER
	private static final String insert_dep=
	"INSERT INTO DEPOSITDETAIL VALUES ('D'||LPAD(to_char(DEPOSITDETAIL_seq.NEXTVAL),6,'0'),?,?,?)";
	//DEPOSITDETAIL
	private static final String update_sessions=
	"UPDATE SESSIONS SET SESSIONS_STATUS=? WHERE SESSIONS_NO = ?";
	//SESSIONS
	private static final String insert_ticketorder=
	"INSERT INTO TICKETORDER (ORDER_NO, MEMBER_NO, FD_NO, SESSIONS_NO, ORDER_TAKEMEALS, ORDER_TIME, ORDER_AMOUNT) VALUES ('TO_'||LPAD(TICKETORDER_seq.NEXTVAL,6,'0'), ?, ?, ?, ?, ?, ?)";
	//TICKETORDER
	private static final String insert_movieticket=
	"INSERT INTO MOVIETICKET VALUES ('MVT'||LPAD(to_char(MOVIETICKET_seq.NEXTVAL),7,'0'), ?, ?, ?, ?, ?)";
	//MOVIETICKET
	
	//交易區間專用指令--結束
	
	
	
	

	
	
	
	@Override
	public void ticketsTradingInterval(String member_no, Integer order_amount, String sessions_no,
			String sessions_status, String fd_no, String[] mt_no, String[] ti_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		
	}
	
	
	
	

	@Override
	public void insert(TicketorderVO ticketorderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
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
	public void update(TicketorderVO ticketorderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
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
		}  catch (SQLException se) {
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_no);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public TicketorderVO findByPrimaryKey(String order_no) {
		TicketorderVO ticketorderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				ticketorderVO = new TicketorderVO();
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
	public List<TicketorderVO> getAll() {
		List<TicketorderVO> list = new ArrayList<TicketorderVO>();
		TicketorderVO ticketorderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				ticketorderVO = new TicketorderVO();
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

}
