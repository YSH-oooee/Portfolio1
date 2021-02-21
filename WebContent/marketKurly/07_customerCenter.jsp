<%@page import="market_Kurly.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="market_Kurly.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String id = (String)session.getAttribute("id");
		String managerId = (String)session.getAttribute("managerId");
		
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int count = 0;
		int number = 0;
		
		int curPage = Integer.parseInt(pageNum);
		count = boardDAO.getInstance().getAllCount();
		
		int startRow = (curPage - 1) * pageSize;
		int endRow = curPage * pageSize;
		
		ArrayList<boardDTO> boardList = boardDAO.getInstance().getAllBoardList(startRow, endRow);
		
		number = count - (curPage - 1) * pageSize;
		
	%>
	
	<h2>고객센터</h2>
	<hr color="purple" width="300" size="1"> <br>
	
	<table border="1" style="border-collapse: collapse;">
		<tr height="30" align="center">
			<td width="50">번호</td>
			<td width="400">제목</td>
			<td width="200">작성자</td>
			<td width="200">작성일</td>
			<td width="50">조회수</td>
		</tr>
	<%
	for(int i = 0; i < boardList.size(); i++) {
		
		boardDTO bean = boardList.get(i);
	%>
		<tr>
			<td width="50" align="center"><%=number--%></td>
			<td width="400" align="left">
	<%
				if(bean.getRe_step() > 1) {
					
					for(int j = 0; j < (bean.getRe_step() - 1) * 5; j++) {
	%>
						&nbsp;
	<%
					}
					
				}
				//관리자면 해당 게시글 내용 보여주기
				if(managerId != null) {
	%>
					<a href="00_shopMain.jsp?center=35_showBoardContent.jsp?num=<%=bean.getNumber()%>" style="text-decoration: none">
						<%=bean.getTitle()%>
					</a>
	<%
				//일반회원이면 해당 게시글 비밀번호 입력
				} else {
	%>
					<a href="00_shopMain.jsp?center=41_checkPwForRead.jsp?num=<%=bean.getNumber()%>" style="text-decoration: none">
						<%=bean.getTitle()%>
					</a>
	<%
				}
	%>
			</td>
			<td width="200" align="center"><%=bean.getWriter() %></td>
			<td width="200" align="center"><%=bean.getReg_date() %></td>
			<td width="50" align="center"><%=bean.getReadcount() %></td>
		</tr>
	<%
	}
	%>
	</table>
	
	<table>
		<tr height="30">
			<td width="910" align="right">
				<input type="button" value="글쓰기" onclick="location.href='00_shopMain.jsp?center=36_write.jsp'">
			</td>
		</tr>
	</table>
	
	<p>
	<%
		if(count > 0) {
			
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1;
			
			if(curPage % pageSize != 0) {
				startPage = (int)(curPage / pageSize) * pageSize + 1;
			} else {
				startPage = ((int)(curPage / pageSize) - 1) * pageSize + 1;
			}
			
			int endPage = startPage + pageSize - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > 10) {
	%>
				<a href="00_shopMain.jsp?center=07_customerCenter.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
	<%
			}
			
			for(int i = startPage; i <= endPage; i++) {
	%>
				<a href="00_shopMain.jsp?center=07_customerCenter.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
			}
			
			if(endPage < pageCount) {
	%>
				<a href="00_shopMain.jsp?center=07_customerCenter.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%
			}
			
		}
	%>

</body>
</html>