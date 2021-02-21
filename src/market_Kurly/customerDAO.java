package market_Kurly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class customerDAO {
	
	private customerDAO() {}
	private static customerDAO instance = new customerDAO();
	public static customerDAO getInstance() {
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
	
	//회원 인증
	public int checkUser(String id, String pw) {
		
		int check = -1;
		String dbpw = "";
		
		try {
			
			conn = getConnection();
			
			String sql = "select pw from customer where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpw = rs.getString(1);
				
				if (dbpw.equals(pw)) {
					check = 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return check;
		
	}
	
	//회원가입
	public void insertMember(String id, String pw, String name, String tel, String address, String email) {
		
		try {
			
			conn = getConnection();
			
			String sql = "insert into customer values(?, ?, ?, now(), ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, address);
			pstmt.setString(6, email);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
	//ID 찾기
	public String findID(String name, String email) {
		
		String id = "";
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from customer where name=? and email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				id = rs.getString("id");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return id;
		
	}
	
	//비밀번호 찾기
	public String findPW(String name, String id, String email) {
		
		String pw = "";
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from customer where name=? and id=? and emqil=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pw = rs.getString("pw");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return pw;
		
	}
	
	//ID 중복확인
	public int checkOverlapID(String id) {
		
		int check = -1;		
		
		try {
			
			String dbID = "";
			conn = getConnection();
			
			String sql = "select * from customer where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dbID = rs.getString("id");
				
				if (dbID.equals(id)) {
					check  = 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return check;
		
	}
	
	//이메일 중복확인
	public int checkOverlapEmail(String email) {
		
		int check = -1;
		String dbEmail = "";
		
		try {
			
			conn = getConnection();
			
			String sql = "select email from customer where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbEmail = rs.getString(1);
				
				if (dbEmail.equals(email)) {
					check = 2;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
		return check;
		
	}

}
