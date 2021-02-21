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
	
		String id = (String)session.getAttribute("id");
		
		customerDTO cbean = buyDAO.getInstance().getCustomerInfo(id);
		ArrayList<cartDTO> itemlist = buyDAO.getInstance().getCartItemList(id);
		
		int number = 0;
		int total = Integer.parseInt(request.getParameter("total"));
	%>
	
	<div>
		<h2>주문서</h2>
		<hr size="2" color="purple" width="300"> <br><br>
		
		<form action="23_insertOrderList.jsp" method="post">
		
			<table>
				<tr height="50">
					<td colspan="4" align="left">
						<h3>구매상품확인</h3>
					</td>
				</tr>
				
				<tr height="5">
					<td colspan="4">
						<hr size="1" color="purple" width="800">
					</td>
				</tr>
	<%
			for(int i = 0; i < itemlist.size(); i++) {
				cartDTO dto = itemlist.get(i);
	%>
				<tr height="50" align="center">
					<td width="200">
						<font size="2"><b><%=++number%></b></font>
					</td>
					<td width="100">
						<img alt="" src="img/<%=dto.getItem_image()%>" height="50">
					</td>
					<td width="400">
						<font size="3"><%=dto.getItem_name()%></font>
					</td>
					<td width="100">
						<font size="3"><%=dto.getBuy_count()%></font>
					</td>
				</tr>
	<%
			}
	%>
			</table>
			
			<table>
				<tr height="40">
					<td colspan="2">
						<h3 align="left">구매자 정보</h3>
					</td>
				</tr>
				
				<tr height="5">
					<td colspan="2">
						<hr size="1" color="gray" width="800">
					</td>
				</tr>
				
				<tr height="50">
					<td width="200" align="center">
						<font size="2"><b>이름</b></font>
					</td>
					<td width="600">
						<input type="text" name="buyername" value="<%=cbean.getName()%>" style="width:200px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="200" align="center">
						<font size="2"><b>연락처</b></font>
					</td>
					<td width="600">
						<input type="text" name="buyertel" value="<%=cbean.getTel()%>" style="width:200px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="200" align="center">
						<font size="2"><b>주소</b></font>
					</td>
					<td width="600">
						<input type="text" name="buyeraddress" value="<%=cbean.getAddress()%>" style="width:200px; height:30px;">
					</td>
				</tr>
			</table> <br>
			
			<table>
				<tr height="50">
					<td colspan="2">
						<h3 align="left">결제방법</h3>
					</td>
				</tr>
				
				<tr height="5">
					<td colspan="2">
						<hr size="1" color="gray" width="800">
					</td>
				</tr>
				
				<tr height="50">
					<td width="200" align="center">
						<font size="2"><b>결제수단</b></font>
					</td>
					<td width="600">
						<select name="howpay">
							<option value="1">계좌이체</option>
							<option value="2">신용카드</option>
						</select>
					</td>
				</tr>
			</table>
			
			<table>
				<tr height="50">
					<td width="800">
						<h3 align="left">결제금액</h3>
					</td>
				</tr>
				
				<tr height="5">
					<td width="800">
						<hr size="1" color="gray" width="800">
					</td>
				</tr>
				
				<tr height="50">
					<td align="right" width="800">
						<h3><%=total %>원</h3>
					</td>
				</tr>
				
				<tr height="50">
					<td align="center" width="800">
						<input type="image" src="img/pay.PNG" name="submit" value="submit" style="height:50px;">
					</td>
				</tr>
			</table>
		
		</form>
	</div>

</body>
</html>