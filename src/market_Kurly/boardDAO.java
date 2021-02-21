package market_Kurly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class boardDAO {
	
	private boardDAO(){}
	private static boardDAO instance = new boardDAO();
	public static boardDAO getInstance() {
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
	
	//게시판 전체 목록
	public ArrayList<boardDTO> getAllBoardList(int start, int end) {
		
		ArrayList<boardDTO> boardlist = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from board order by ref desc, re_level limit ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end - start);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				boardDTO dto = new boardDTO();
				
				dto.setNumber(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setPw(rs.getString("pw"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setContent(rs.getString("content"));
				
				boardlist.add(dto);
				
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }			
		}
		
		return boardlist;
		
	}
	
	//전체 게시글 수
	public int getAllCount() {
		
		int count = 0;
		
		try {
			
			conn = getConnection();
			
			String sql = "select count(*) from board";
			
			pstmt = conn.prepareStatement(sql);
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
	
	//작성한 글을 게시판목록에 삽입
	public void insertBoard(boardDTO dto) {
		
		int ref = 0;
		int num = 0;
		
		try {
			
			conn = getConnection();
			
			String refsql = "select max(ref) from baord";
			
			pstmt = conn.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			String numsql = "select max(num) from board";
			
			pstmt = conn.prepareStatement(numsql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			String sql = "insert into board (num, writer, title, pw, reg_date, ref, re_step, re_level, readcount, content)";
			sql += " values (?, ?, ?, ?, now(), ?, 1, 1, 0, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, ref);
			pstmt.setString(6, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
	//비밀번호 확인
	public int checkPasswd(int num, String pw) {
		
		int check = -1;
		
		try {
			
			conn = getConnection();
			
			String sql = "select * from board where num=? and pw=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				check = 1;
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
	
	//게시글 불러오기
	public boardDTO getOneBoard(int number) {
		
		boardDTO dto = new boardDTO();
		
		try {
			
			conn = getConnection();
			
			String readsql = "update board set readcount = readcount + 1 where num=?";
			
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
			String sql = "select * from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto.setNumber(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setPw(rs.getString("pw"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setContent(rs.getString("content"));
				
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
	
	//게시글 삭제
	public void deleteBoard(int num) {
		
		try {
			
			conn = getConnection();
			
			String sql = "delete from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
	//게시글 수정
	public void updateBoard(int num) {
		
		boardDTO bean = new boardDTO();
		
		try {
			
			conn = getConnection();
			
			String sql = "update board set title=?, content=? where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
	//답글 작성
	public void reWrite(boardDTO dto) {
		
		int ref = dto.getRef();				//원본 글과 동일
		int re_step = dto.getRe_step();		//원본 글 + 1
		int re_level = dto.getRe_level();	//원본 글 + 1
		int num = 0;
		
		try {
			
			conn = getConnection();
			
			String numsql = "select max(num) from board";
			
			pstmt = conn.prepareStatement(numsql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			String levelsql = "update board set re_level=re_level+1 where ref=? and re_level=?";
			
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			String sql = "insert into board(num, writer, title, pw, reg_date, ref, re_step, re_level, readcount, content)";
			sql += " values(?, ?, ?, ?, now(), ?, ?, ?, 0, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1);
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try { conn.close(); } catch (SQLException sqle) {} }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException sqle) {} }
			if(rs != null) { try { rs.close(); } catch (SQLException sqle) {} }
		}
		
	}
	
}
