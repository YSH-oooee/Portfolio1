<%@page import="market_Kurly.cartDAO"%>
<%@page import="market_Kurly.cartDTO"%>
<%@page import="java.util.ArrayList"%>
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
	
		String id = (String)session.getAttribute("id");
		
		ArrayList<cartDTO> cartlist = cartDAO.getInstance().getCartList(id);
		
		int number = 0;
		int count = cartDAO.getInstance().countCartItem(id);
		int total = 0;
		int deliveryfee = 3000;
	%>
	
	<h2>장바구니</h2>
	<hr size="2" color="purple" width="300">
	
	<%
		if(count == 0) {
	%>
			<h3>장바구니에 담겨있는 상품이 없습니다.</h3>
	<%
		} else {
			
			for(int i = 0; i < cartlist.size(); i++) {
				cartDTO dto = cartlist.get(i);
	%>
			<table>
				<tr height="40">
					<td width="50" align="center">
						<font size="2"><%=++number%></font>
					</td>
					<td width="100" align="center">
						<img alt="" src="img/<%=dto.getItem_image()%>" height="40">
					</td>
					<td width="300">
						<font size="3"><b><%=dto.getItem_name()%></b></font>
					</td>
					<td width="100" align="center">
						<font size="3"><b><%=dto.getBuy_count()%></b></font>
					</td>
					<td width="100">
						<font size="3"><b><%=dto.getBuy_price() * dto.getBuy_count()%>원</b></font>
					</td>
					<td width="40" align="center">
						<input type="image" src="img/delete.png" onclick="location.href='21_deleteCart.jsp?cart_number=<%=dto.getCart_number()%>'">
					</td>
				</tr>
			</table>
			
			<hr size="1" color="gray" width="680">
	<%
				total += dto.getBuy_price() * dto.getBuy_count();
			}
	%>
			<form action="00_shopMain.jsp?center=22_order.jsp" method="post">
			
				<table>
					<tr height="30" align="right">
						<td width="480">
							<h4>총 상품금액</h4>
						</td>
						<td width="200">
							<h4><%=total%>원</h4>
						</td>
					</tr>
					
					<tr height="30" align="right">
						<td width="480">
							<h4>배송비</h4>
						</td>
						<td width="200">
	<%
						if(total < 40000) {
	%>
							<h4><%=deliveryfee%>원</h4>
							<font size="2" color="purple"><%=40000 - total%>원 추가주문 시, 무료배송</font>
	<%
						} else {
	%>
							<h4>0원</h4>
	<%
						}
	%>
						</td>
					</tr>
					
					<tr height="40" align="right">
						<td width="480">
							<h3>총 결제금액</h3>
						</td>
						<td width="200">
	<%
						if(total < 40000) {
	%>
							<h3><b><%=total + deliveryfee%>원</b></h3>
	<%
						} else {
	%>
							<h3><b><%=total%>원</b></h3>
	<%
						}
	%>
						</td>
					</tr>
					
					<tr height="30" align="right">
						<td colspan="2">
							<input type="image" src="img/order.PNG" name="submit" value="submit" style="height:50px">
							<input type="hidden" name="total" value="<%=total %>">
						</td>
					</tr>
				</table>
			
			</form>
	<%
		}
	%>

</body>
</html>