package ezs.sec_ord.model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import ezs.sec_ord_details.model.SecOrdDetailsJDBCDAO;
import ezs.sec_ord_details.model.SecOrdDetailsVO;
import util.Util;

public class SecOrdJDBCDAO implements SecOrdDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO " + "`CFA104G5`.`SEC_ORD` "
			+ "(sh_buyerid, sh_sellerid, sh_postcode, sh_county, sh_dist, "
			+ "sh_road, sh_payment, sh_ord_status, sh_price, sh_date, " + "sh_notes)" + "VALUES " + "(?, ?, ?, ?, ?"
			+ ", ?, ?, ?, ?, ?" + ", ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_ORD` WHERE sh_ord_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_ORD` "
			+ "SET sh_buyerid=?, sh_sellerid=?, sh_postcode=?, sh_county=?, sh_dist=?, "
			+ "sh_road=?, sh_payment=?, sh_ord_status=?, sh_price=?, sh_date=?, "
			+ "sh_buyer_score=?, sh_buyer_txt=?, sh_seller_score=?, sh_seller_txt=?, sh_appdate=?, " + "sh_notes=?"
			+ "WHERE sh_ord_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` WHERE sh_ord_id = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` ORDER BY sh_ord_id";
	private static final String GET_ALL_BY_MEMID_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` WHERE sh_buyerid = ? ORDER BY sh_ord_id desc;";
	private static final String GET_ALL_BY_SELLERID_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` WHERE sh_sellerid = ? ORDER BY sh_ord_id desc;";
	private static final String UPDATE_COMPLETE_ORDER_STMT = "UPDATE `CFA104G5`.`SEC_ORD` SET sh_ord_status = 7 WHERE sh_ord_id = ?; ";
	private static final String UPDATE_REFUND_ORDER_STMT = "UPDATE `CFA104G5`.`SEC_ORD` SET sh_ord_status = 6 WHERE sh_ord_id = ?; ";
//	private static final String GET_ORD_DETAILS_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` s JOIN `CFA104G5`.`SEC_ORD_DETAILS` s1 ON s.sh_ord_id = s1.sh_ord_id";
	private static final String GET_ORDDETAILS_BYSECORD_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD_DETAILS` WHERE sh_ord_id = ?";
	private static final String UPDATE_CANCEL_ORDER_STMT = "UPDATE `CFA104G5`.`SEC_ORD` SET sh_ord_status = 8 WHERE sh_ord_id = ?; ";
	private static final String UPDATE_STATUS_STMT = "UPDATE `CFA104G5`.`SEC_ORD` set sh_ord_status = ? WHERE sh_ord_id = ?";

	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(SecOrdVO secOrdVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secOrdVO.getShBuyerID());
			pstmt.setInt(2, secOrdVO.getShSellerID());
			pstmt.setInt(3, secOrdVO.getShPostcode());
			pstmt.setString(4, secOrdVO.getShCounty());
			pstmt.setString(5, secOrdVO.getShDist());
			pstmt.setString(6, secOrdVO.getShRoad());
			pstmt.setInt(7, secOrdVO.getShPayment());
			pstmt.setInt(8, secOrdVO.getShOrdStatus());
			pstmt.setBigDecimal(9, secOrdVO.getShPrice());
			pstmt.setDate(10, secOrdVO.getShDate());
			pstmt.setString(11, secOrdVO.getShNotes());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer shOrdID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shOrdID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecOrdVO secOrdVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, secOrdVO.getShBuyerID());
			pstmt.setInt(2, secOrdVO.getShSellerID());
			pstmt.setInt(3, secOrdVO.getShPostcode());
			pstmt.setString(4, secOrdVO.getShCounty());
			pstmt.setString(5, secOrdVO.getShDist());
			pstmt.setString(6, secOrdVO.getShRoad());
			pstmt.setInt(7, secOrdVO.getShPayment());
			pstmt.setInt(8, secOrdVO.getShOrdStatus());
			pstmt.setBigDecimal(9, secOrdVO.getShPrice());
			pstmt.setDate(10, secOrdVO.getShDate());
			pstmt.setInt(11, secOrdVO.getShBuyerScore());
			pstmt.setString(12, secOrdVO.getShBuyerTXT());
			pstmt.setInt(13, secOrdVO.getShSellerScore());
			pstmt.setString(14, secOrdVO.getShSellerTXT());
			pstmt.setDate(15, secOrdVO.getShAPPDate());
			pstmt.setString(16, secOrdVO.getShNotes());
			pstmt.setInt(17, secOrdVO.getShOrdID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecOrdVO findByPrimaryKey(Integer shOrdID) {

		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shOrdID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
			}
			return secOrdVO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<SecOrdVO> getAll() {
		List<SecOrdVO> list = new ArrayList<SecOrdVO>();
		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
				list.add(secOrdVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public Set<SecOrdVO> getSecOrdByShBuyerID(Integer shBuyerID) {
		Set<SecOrdVO> set = new LinkedHashSet<SecOrdVO>();
		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_MEMID_STMT);
			pstmt.setInt(1, shBuyerID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
				set.add(secOrdVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return set;
	}

	@Override
	public void updateCompleteOrder(Integer shOrdID) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_COMPLETE_ORDER_STMT);
			pstmt.setInt(1, shOrdID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void refundOrder(Integer shOrdID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_REFUND_ORDER_STMT);
			pstmt.setInt(1, shOrdID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public Set<SecOrdVO> getSecOrdByShSellerID(Integer shSellerID) {
		Set<SecOrdVO> set = new LinkedHashSet<SecOrdVO>();
		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_SELLERID_STMT);
			pstmt.setInt(1, shSellerID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
				set.add(secOrdVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return set;
		
	

	}

	@Override
	public Set<SecOrdDetailsVO> getSecAllOrdDeatails(Integer shOrdID) {
		Set<SecOrdDetailsVO> set = new LinkedHashSet<SecOrdDetailsVO>();
		SecOrdDetailsVO secOrdDetailsVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ORDDETAILS_BYSECORD_STMT);
			pstmt.setInt(1, shOrdID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdDetailsVO = new SecOrdDetailsVO();
				secOrdDetailsVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdDetailsVO.setShID(rs.getInt("sh_id"));
				secOrdDetailsVO.setShName(rs.getString("sh_name"));
				secOrdDetailsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdDetailsVO.setShQty(rs.getInt("sh_qty"));

				set.add(secOrdDetailsVO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return set;
	}

	@Override
	public void updateCancleOrder(Integer shOrdID) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_CANCEL_ORDER_STMT);
			pstmt.setInt(1, shOrdID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void updateOrderStatus(SecOrdVO secOrdVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STATUS_STMT);
			pstmt.setInt(1, secOrdVO.getShOrdStatus());
			pstmt.setInt(2, secOrdVO.getShOrdID());
	
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void insertWithSecOrdDetails(SecOrdVO secOrdVO, List<SecOrdDetailsVO> list) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			// 1???Setting??? pstmt.executeUpdate()??????
			con.setAutoCommit(false);

			// ???????????????
			String cols[] = { "sh_ord_id" };
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			pstmt.setInt(1, secOrdVO.getShBuyerID());
			pstmt.setInt(2, secOrdVO.getShSellerID());
			pstmt.setInt(3, secOrdVO.getShPostcode());
			pstmt.setString(4, secOrdVO.getShCounty());
			pstmt.setString(5, secOrdVO.getShDist());
			pstmt.setString(6, secOrdVO.getShRoad());
			pstmt.setInt(7, secOrdVO.getShPayment());
			pstmt.setInt(8, secOrdVO.getShOrdStatus());
			pstmt.setBigDecimal(9, secOrdVO.getShPrice());
			pstmt.setDate(10, secOrdVO.getShDate());
			pstmt.setString(11, secOrdVO.getShNotes());

			Statement stmt = con.createStatement();
			stmt.executeUpdate("set auto_increment_offset=1;"); // ????????????-?????????
			stmt.executeUpdate("set auto_increment_increment=1;"); // ????????????-??????

			pstmt.executeUpdate();
			// ??????????????????????????????
			String next_secOrdno = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_secOrdno = rs.getString(1);
//				System.out.println("???????????????= " + next_secOrdno + "(??????????????????????????????)");
			} else {
				System.out.println("????????????????????????");
			}
			rs.close();
			// ?????????Add an Order??????
			SecOrdDetailsJDBCDAO dao = new SecOrdDetailsJDBCDAO();
//			System.out.println("list.size()-A=" + list.size());
			for (SecOrdDetailsVO aSecOrdDetails : list) {
				aSecOrdDetails.setShOrdID(Integer.valueOf(next_secOrdno));
				dao.insert2(aSecOrdDetails, con);
			}

			// 2???Setting??? pstmt.executeUpdate()??????
			con.commit();
			con.setAutoCommit(true);
//			System.out.println("list.size()-B=" + list.size());
//			System.out.println("Add an Order??????" + next_secOrdno + "???,??????????????????" + list.size() + "??????????????????");

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3???Setting?????????exception????????????catch?????????
					System.err.print("Transaction is being ");
					System.err.println("rolled back-???-secOrd");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	
// 	??????Add an Order?????????????????????????????????
	public static void main(String[] args) {

		SecOrdJDBCDAO dao = new SecOrdJDBCDAO();

		SecOrdVO secOrdVO = new SecOrdVO();
		secOrdVO.setShBuyerID(1);
		secOrdVO.setShSellerID(2);
		secOrdVO.setShPostcode(320);
		secOrdVO.setShCounty("????????????????????????");
		secOrdVO.setShDist("????????????");
		secOrdVO.setShRoad("????????????????????????????????????");
		secOrdVO.setShPayment(10);
		secOrdVO.setShOrdStatus(2);
		secOrdVO.setShPrice(new BigDecimal(1000));
		secOrdVO.setShDate(new java.sql.Date(new java.util.Date().getTime()));
		secOrdVO.setShAPPDate(new java.sql.Date((new java.util.Date().getTime()) + 14 * 24 * 60 * 60 * 1000L));
		secOrdVO.setShNotes("zzz");

		List<SecOrdDetailsVO> testList = new ArrayList<SecOrdDetailsVO>(); // ????????????????????????
		SecOrdDetailsVO secOrdDetailsVO1 = new SecOrdDetailsVO(); // ??????POJO1
		secOrdDetailsVO1.setShID(1);
		secOrdDetailsVO1.setShName("????????????1");
		secOrdDetailsVO1.setShPrice(new BigDecimal(100));
		secOrdDetailsVO1.setShQty(1);

		SecOrdDetailsVO secOrdDetailsVO2 = new SecOrdDetailsVO(); // ??????POJO1
		secOrdDetailsVO2.setShID(2);
		secOrdDetailsVO2.setShName("????????????2");
		secOrdDetailsVO2.setShPrice(new BigDecimal(10000));
		secOrdDetailsVO2.setShQty(2);

		testList.add(secOrdDetailsVO1);
		testList.add(secOrdDetailsVO2);

		dao.insertWithSecOrdDetails(secOrdVO, testList);
	}
}
