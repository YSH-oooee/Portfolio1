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
		
		boardDAO.getInstance().deleteBoard(number);
	%>
	
	<script type="text/javascript">
		alert("게시글이 삭제되었습니다.");
		location.href="00_shopMain.jsp?center=07_customerCenter.jsp";
	</script>

</body>
</html>