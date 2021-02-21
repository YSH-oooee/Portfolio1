<%@page import="market_Kurly.managerDAO"%>
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
	
		int item_number = Integer.parseInt(request.getParameter("item_number"));
		
		System.out.println("item_number : " + item_number);
		
		managerDAO.getInstance().deleteItem(item_number);
		response.sendRedirect("00_shopMain.jsp?center=28_itemInfoUpdate.jsp");
	%>

</body>
</html>