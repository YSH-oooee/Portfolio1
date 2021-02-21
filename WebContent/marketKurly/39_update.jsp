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
	
		int number = Integer.parseInt(request.getParameter("number"));
		
		boardDTO bdto = boardDAO.getInstance().getOneBoard(number);
	%>
	
	<form action="40_updatePro.jsp" method="post">
	
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
				<td colspan="3">
					<input type="text" value="<%=bdto.getTitle() %>" size="30">
				</td>
			</tr>
			<tr height="40" align="center">
				<td width="120">글내용</td>
				<td colspan="3">
					<textarea rows="10" cols="50" name="content">
						<%=bdto.getContent() %>
					</textarea>
				</td>
			</tr>
		</table> <br>
		
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="다시작성">
		<input type="hidden" name="number" value=<%=number %>>
	
	</form>

</body>
</html>