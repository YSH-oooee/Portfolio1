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
	
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String pw = request.getParameter("pw");
		String content = request.getParameter("content");
		
		boardDTO bdto = new boardDTO();
		
		bdto.setWriter(writer);
		bdto.setTitle(title);
		bdto.setPw(pw);
		bdto.setContent(content);
		
		boardDAO.getInstance().insertBoard(bdto);
		response.sendRedirect("00_shopMain.jsp?center=07_customerCenter.jsp");
	%>

</body>
</html>