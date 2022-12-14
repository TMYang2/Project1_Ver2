package ezs.sec_ord_details.model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.Util;

public class SecOrdDetailsJDBCDAO implements SecOrdDetailsDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_ORD_DETAILS` (sh_ord_id,sh_id,sh_name,sh_price,sh_qty) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT sh_ord_id,sh_id,sh_name,sh_price,sh_qty FROM `CFA104G5`.`SEC_ORD_DETAILS` ORDER BY sh_ord_id,sh_id";
	private static final String GET_ONE_STMT = "SELECT sh_ord_id,sh_id,sh_name,sh_price,sh_qty FROM `CFA104G5`.`SEC_ORD_DETAILS` WHERE (sh_ord_id, sh_id )= ( ?,?) ";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`SEC_ORD_DETAILS` WHERE (sh_ord_id, sh_id )= ( ?,?)";
	private static final String UPDATE = "UPDATE `CFA104G5`.`SEC_ORD_DETAILS` SET sh_name=?, sh_price=?, sh_qty=? WHERE (sh_ord_id, sh_id )= ( ?,?)";
	private static final String GET_BY_ORD_ID_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD_DETAILS` WHERE sh_ord_id = ?";
	
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(SecOrdDetailsVO secOrdDetailsVO) {

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secOrdDetailsVO.getShOrdID());
			pstmt.setInt(2, secOrdDetailsVO.getShID());
			pstmt.setString(3, secOrdDetailsVO.getShName());
			pstmt.setBigDecimal(4, secOrdDetailsVO.getShPrice());
			pstmt.setInt(5, secOrdDetailsVO.getShQty());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SecOrdDetailsVO secOrdDetailsVO) {

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, secOrdDetailsVO.getShName());
			pstmt.setBigDecimal(2, secOrdDetailsVO.getShPrice());
			pstmt.setInt(3, secOrdDetailsVO.getShQty());
			pstmt.setInt(4, secOrdDetailsVO.getShOrdID());
			pstmt.setInt(5, secOrdDetailsVO.getShID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer shOrdID, Integer shID) {

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, shOrdID);
			pstmt.setInt(2, shID);
			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SecOrdDetailsVO findByPrimaryKey(Integer shOrdID, Integer shID) {
		SecOrdDetailsVO secOrdDetailsVO = null;

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, shOrdID);
			pstmt.setInt(2, shID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdDetailsVO = new SecOrdDetailsVO();
				secOrdDetailsVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdDetailsVO.setShID(rs.getInt("sh_id"));
				secOrdDetailsVO.setShName(rs.getString("sh_name"));
				secOrdDetailsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdDetailsVO.setShQty(rs.getInt("sh_qty"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return secOrdDetailsVO;

	}

	@Override
	public List<SecOrdDetailsVO> getAll() {
		List<SecOrdDetailsVO> list = new ArrayList<SecOrdDetailsVO>();
		SecOrdDetailsVO secOrdDetailsVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				secOrdDetailsVO = new SecOrdDetailsVO();
				secOrdDetailsVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdDetailsVO.setShID(rs.getInt("sh_id"));
				secOrdDetailsVO.setShName(rs.getString("sh_name"));
				secOrdDetailsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdDetailsVO.setShQty(rs.getInt("sh_qty"));

				list.add(secOrdDetailsVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public void insert2 (SecOrdDetailsVO secOrdDetailsVO , Connection con) {

		try {
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secOrdDetailsVO.getShOrdID());  // ?????????????????????
			pstmt.setInt(2, secOrdDetailsVO.getShID());
			pstmt.setString(3, secOrdDetailsVO.getShName());
			pstmt.setBigDecimal(4, secOrdDetailsVO.getShPrice());
			pstmt.setInt(5, secOrdDetailsVO.getShQty());
     		

			Statement stmt=	con.createStatement();
			//stmt.executeUpdate("set auto_increment_offset=7001;"); //????????????-?????????
			stmt.executeUpdate("set auto_increment_increment=1;");   //????????????-??????
			
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3???Setting?????????exception????????????catch?????????
					System.err.print("Transaction is being ");
					System.err.println("rolled back-???-secOrdDetails");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			Util.closeResource(null, pstmt, rs);
		}

	}

	@Override
	public List<SecOrdDetailsVO> findByShOrdID(Integer shOrdID) {
		List<SecOrdDetailsVO> list = new ArrayList<SecOrdDetailsVO>();
		SecOrdDetailsVO secOrdDetailsVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_ORD_ID_STMT);
			pstmt.setInt(1, shOrdID);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				secOrdDetailsVO = new SecOrdDetailsVO();
				secOrdDetailsVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdDetailsVO.setShID(rs.getInt("sh_id"));
				secOrdDetailsVO.setShName(rs.getString("sh_name"));
				secOrdDetailsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdDetailsVO.setShQty(rs.getInt("sh_qty"));

				list.add(secOrdDetailsVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
