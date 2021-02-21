<%@page import="market_Kurly.boardDTO"%>
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
	
		int number = Integer.parseInt(request.getParameter("num"));
		
		boardDTO bdto = boardDAO.getInstance().getOneBoard(number);
		
		int ref = bdto.getRef();
		int re_step = bdto.getRe_step();
		int re_level = bdto.getRe_level();
	%>
	
	<form action="44_writeAnswerPro.jsp" method="post">
	
		<table border="1" style="border-collapse: collapse;">
			<tr height="50">
				<td width="200" align="center">작성자</td>
				<td width="400">관리자</td>
			</tr>
			
			<tr height="50">
				<td width="200" align="center">제목</td>
				<td width="400">
					<input type="text" name="title" value="[답변]" size="50">
				</td>
			</tr>
			
			<tr height="50">
				<td width="200" align="center">비밀번호</td>
				<td width="400">
					<input type="password" name="pw" size="20">
				</td>
			</tr>
			
			<tr height="50">
				<td width="200" align="center">내용</td>
				<td width="400">
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>
			</tr>
			
			<tr height="40">
				<td colspan="2" align="center">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="hidden" name="writer" value="관리자">
					<input type="submit" value="답글쓰기"> &nbsp;
					<input type="reset" value="다시작성"> &nbsp;
					<input type="button" onclick="location.href='00_shopMain.jsp?center=07_customerCenter.jsp'" value="전체글보기">
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>