<%@page import="market_Kurly.buyDTO"%>
<%@page import="market_Kurly.cartDAO"%>
<%@page import="market_Kurly.cartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="market_Kurly.buyDAO"%>
<%@page import="market_Kurly.customerDTO"%>
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
	
		String customer_id = (String)session.getAttribute("id");
		
		customerDTO cbean = buyDAO.getInstance().getCustomerInfo(customer_id);
		ArrayList<cartDTO> cartlist = cartDAO.getInstance().getCartList(customer_id);
		
		int how = Integer.parseInt(request.getParameter("howpay"));
		String pay = "";
		
		if(how == 1) {
			pay = "계좌이체";
		} else if(how == 2) {
			pay = "신용카드";
		}
		
		for(int i = 0; i < cartlist.size(); i++) {
			
			cartDTO cdto = cartlist.get(i);
			
			String customer_name = cbean.getName();
			int cart_number = cdto.getCart_number();
			String item_name = cdto.getItem_name();
			int buy_price = cdto.getBuy_price();
			int buy_count = cdto.getBuy_count();
			String item_image = cdto.getItem_image();
			String howpay = pay;
			String address = cbean.getAddress();
			
			buyDTO bdto = new buyDTO();
			
			bdto.setCustomer_id(customer_id);
			bdto.setCustomer_name(customer_name);
			bdto.setCart_number(cart_number);
			bdto.setItem_name(item_name);
			bdto.setBuy_price(buy_price);
			bdto.setBuy_count(buy_count);
			bdto.setItem_image(item_image);
			bdto.setHowpay(howpay);
			bdto.setAddress(address);
			
			buyDAO.getInstance().insertOrderList(bdto);
			buyDAO.getInstance().updateSold(item_name, buy_count);			
			
		}
		
		buyDAO.getInstance().deleteCartList(customer_id);
	%>
	
	<script type="text/javascript">
		alert("주문이 완료되었습니다.");
		location.href="00_shopMain.jsp";
	</script>

</body>
</html>