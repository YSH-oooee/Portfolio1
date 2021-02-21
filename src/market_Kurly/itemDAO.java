package market_Kurly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class itemDAO {
	
	private itemDAO() {}
	private static itemDAO instance = new itemDAO();
	public static itemDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB연동
	public Connection getConnection() {
		
		String dbURL = "jdbc:mysql://localhost:3306/marketkurlydb01?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	//전체 상품목록
	public ArrayList<itemDTO> getAllItem() {
		
		ArrayList<itemDTO> itemlist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from item order by item_number asc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				do {
					
					itemDTO dto = new itemDTO();
					
					dto.setItem_number(rs.getInt("item_number"));
					dto.setItem_category(rs.getString("item_category"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_price(rs.getInt("item_price"));
					dto.setItem_stock(rs.getInt("item_stock"));
					dto.setItem_image(rs.getString("item_image"));
					dto.setItem_info(rs.getString("item_info"));
					dto.setDiscount_rate(rs.getInt("discount_rate"));
					dto.setReg_date(rs.getString("reg_date"));
					dto.setSold(rs.getInt("sold"));
					
					itemlist.add(dto);
					
				} while (rs.next());
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return itemlist;
		
	}
	
	//신상품 목록 (최신 등록 상품 3개)
	public ArrayList<itemDTO> getNewItem(){
		
		ArrayList<itemDTO> newlist = new ArrayList<>();
				
		try {
			
			conn = getConnection();
			
			String sql = "select * from item order by reg_date desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int i = 0;
			while (rs.next()) {
				
				itemDTO dto = new itemDTO();
				
				dto.setItem_number(rs.getInt("item_number"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_stock(rs.getInt("item_stock"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setItem_info(rs.getString("item_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				newlist.add(dto);
				i++;
				
				if (i > 2) {
					break;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return newlist;
		
	}
	
	//알뜰상품 목록 (할인율 20% 이상)
	public ArrayList<itemDTO> getDiscountItem() {
		
		ArrayList<itemDTO> discountlist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from item where discount_rate>=20";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				itemDTO dto = new itemDTO();
				
				dto.setItem_number(rs.getInt("item_number"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_stock(rs.getInt("item_stock"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setItem_info(rs.getString("item_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				discountlist.add(dto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return discountlist;
		
	}
	
	//best상품 (주문량 많은 순서 3개)
	public ArrayList<itemDTO> getBestItem(){
		
		ArrayList<itemDTO> bestlist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from item order by sold desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while (rs.next()) {
				
				itemDTO dto = new itemDTO();
				
				dto.setItem_number(rs.getInt("item_number"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_stock(rs.getInt("item_stock"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setItem_info(rs.getString("item_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				bestlist.add(dto);
				i++;
				
				if (i > 2) {
					break;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return bestlist;
		
	}
	
	//카테고리별 상품
	public ArrayList<itemDTO> getOneCategory(String category) {
		
		ArrayList<itemDTO> catelist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from item where item_category=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				do {
					
					itemDTO dto = new itemDTO();
					
					dto.setItem_number(rs.getInt("item_number"));
					dto.setItem_category(rs.getString("item_category"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_price(rs.getInt("item_price"));
					dto.setItem_stock(rs.getInt("item_stock"));
					dto.setItem_image(rs.getString("item_image"));
					dto.setItem_info(rs.getString("item_info"));
					dto.setDiscount_rate(rs.getInt("discount_rate"));
					dto.setReg_date(rs.getString("reg_date"));
					dto.setSold(rs.getInt("sold"));
					
					catelist.add(dto);
					
				} while (rs.next());
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return catelist;
		
	}
	
	//상품 상세보기
	public itemDTO getOneItem(int num) {
		
		itemDTO dto = null;
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from item where item_number=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto = new itemDTO();
				
				dto.setItem_number(rs.getInt("item_number"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_stock(rs.getInt("item_stock"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setItem_info(rs.getString("item_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return dto;
		
	}

}
