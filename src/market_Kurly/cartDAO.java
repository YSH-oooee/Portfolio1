package market_Kurly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class cartDAO {
	
	private cartDAO() {}
	private static cartDAO instance = new cartDAO();
	public static cartDAO getInstance() {
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
	
	//장바구니 담기
	public void insertCart(cartDTO dto) {
		
		int cart_number = 0;
		
		try {
			
			conn = getConnection();
			
			String sql = "select max(cart_number) from cart";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cart_number = rs.getInt(1);
			}
			
			sql = "insert into cart(cart_number, buyer, item_name, buy_price, buy_count, item_image)";
			sql += " values(?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number + 1);
			pstmt.setString(2, dto.getBuyer());
			pstmt.setString(3, dto.getItem_name());
			pstmt.setInt(4, dto.getBuy_price());
			pstmt.setInt(5, dto.getBuy_count());
			pstmt.setString(6, dto.getItem_image());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
	//장바구니 보기
	public ArrayList<cartDTO> getCartList(String id) {
		
		ArrayList<cartDTO> cartlist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from cart where buyer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				cartDTO dto = new cartDTO();
				
				dto.setCart_number(rs.getInt("cart_number"));
				dto.setBuyer(rs.getString("buyer"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setBuy_count(rs.getInt("buy_count"));
				dto.setItem_image(rs.getString("item_image"));
				
				cartlist.add(dto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return cartlist;
		
	}
	
	//장바구니 상품 개수
	public int countCartItem(String id) {
		
		int count = 0;
		
		try {
			
			conn = getConnection();
			
			String sql = "select count(*) from cart where buyer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return count;
		
	}
	
	//장바구니 상품 삭제
	public void deleteCartItem(int cart_number) {
		
		try {
			
			conn = getConnection();
			
			String sql = "delete from cart where cart_number=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
		}
		
	}

}
