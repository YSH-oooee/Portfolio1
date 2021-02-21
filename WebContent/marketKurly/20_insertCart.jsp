<%@page import="market_Kurly.cartDAO"%>
<%@page import="market_Kurly.cartDTO"%>
<%@page import="market_Kurly.itemDAO"%>
<%@page import="market_Kurly.itemDTO"%>
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
	
		String buyer = (String)session.getAttribute("id");
		int item_number = Integer.parseInt(request.getParameter("item_number"));
		
		itemDTO bean = itemDAO.getInstance().getOneItem(item_number);
		
		int buy_price = bean.getItem_price() - bean.getItem_price() * bean.getDiscount_rate() / 100;
		int buy_count = Integer.parseInt(request.getParameter("buycnt"));
		String item_image = bean.getItem_image();
		String item_name = bean.getItem_name();
		
		cartDTO dto = new cartDTO();
		
		dto.setBuyer(buyer);
		dto.setItem_name(item_name);
		dto.setBuy_price(buy_price);
		dto.setBuy_count(buy_count);
		dto.setItem_image(item_image);
		
		cartDAO.getInstance().insertCart(dto);
	%>
	
	<script type="text/javascript">
		alert("상품을 장바구니에 담았습니다.");
		location.href="00_shopMain.jsp?center=19_cartInfo.jsp";
	</script>

</body>
</html>