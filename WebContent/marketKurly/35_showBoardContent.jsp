<%@page import="market_Kurly.boardDAO"%>
<%@page import="market_Kurly.boardDTO"%>
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
	
		int number = Integer.parseInt(request.getParameter("num"));
		
		boardDTO bdto = boardDAO.getInstance().getOneBoard(number);
	%>
	
	<table border="1" style="border-collapse: collapse;">
		<tr height="40" align="center">
			<td width="120">글번호</td>
			<td width="180"><%=bdto.getNumber() %></td>
			<td width="120">조회수</td>
			<td width="180"><%=bdto.getReadcount() %></td>
		</tr>
		
		<tr height="40" align="center">
			<td width="120">작성자</td>
			<td width="180"><%=bdto.getWriter() %></td>
			<td width="120">작성일</td>
			<td width="180"><%=bdto.getReg_date() %></td>
		</tr>
		
		<tr height="40" align="center">
			<td width="120">제목</td>
			<td colspan="3"><%=bdto.getTitle() %></td>			
		</tr>
		
		<tr height="40" align="center">
			<td width="120">글내용</td>
			<td colspan="3"><%=bdto.getContent() %></td>
		</tr>
		
		<tr height="40" align="center">
			<td colspan="4">
				<input type="button" value="답글쓰기" onclick="location.href='00_shopMain.jsp?center=43_writeAnswer.jsp?num=<%=bdto.getNumber()%>'">
				<input type="button" value="수정하기" onclick="location.href='00_shopMain.jsp?center=39_update.jsp?num=<%=bdto.getNumber()%>'">
				<input type="button" value="삭제하기" onclick="location.href='38_delete.jsp?num=<%=bdto.getNumber()%>'">
				<input type="button" value="목록보기" onclick="location.href='00_shopMain.jsp?center=07_customerCenter.jsp'">
			</td>
		</tr>
	</table>

</body>
</html>