<%@page import="market_Kurly.cartDAO"%>
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
	
		int cart_number = Integer.parseInt(request.getParameter("cart_number"));
		String buyer = (String)session.getAttribute("id");
		
		if(buyer == null) {
	%>
		<script type="text/javascript">
			alert("로그인 후 이용이 가능합니다.");
			location.href="00_shopMain.jsp";
		</script>
	<%
		} else {
			cartDAO.getInstance().deleteCartItem(cart_number);
			response.sendRedirect("00_shopMain.jsp?center=19_cartInfo.jsp");
		}
	%>

</body>
</html>