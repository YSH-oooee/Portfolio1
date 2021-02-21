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
	
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String pw = request.getParameter("pw");
		String content = request.getParameter("content");
		
		boardDTO bdto = new boardDTO();
		
		bdto.setRef(ref);
		bdto.setRe_step(re_step);
		bdto.setRe_level(re_level);
		bdto.setWriter(writer);
		bdto.setTitle(title);
		bdto.setPw(pw);
		bdto.setContent(content);
		
		boardDAO.getInstance().reWrite(bdto);
		response.sendRedirect("00_shopMain.jsp?center=07_customerCenter.jsp");
	%>

</body>
</html>