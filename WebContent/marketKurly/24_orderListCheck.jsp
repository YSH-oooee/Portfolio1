<%@page import="market_Kurly.buyDAO"%>
<%@page import="market_Kurly.buyDTO"%>
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
		
		ArrayList<buyDTO> buylist = buyDAO.getInstance().getBuyList(id);
		
		int number = 0;
	%>
	
	<h3>주문내역 확인</h3>
		<hr size="1" colot="purple" width="300"> <br><br>
		
		<table>
			<tr height="50" align="center">
				<td width="50">
					<font size="3" color="purple">번호</font>
				</td>
				<td width="50">
					<font size="3" color="purple"></font>
				</td>
				<td width="100">
					<font size="3" color="purple">상품명</font>
				</td>
				<td width="50">
					<font size="3" color="purple">수량</font>
				</td>
				<td width="100">
					<font size="3" color="purple">가격</font>
				</td>
				<td width="200">
					<font size="3" color="purple">주문일</font>
				</td>
				<td width="150">
					<font size="3" color="purple">결제수단</font>
				</td>
			</tr>
			
			<tr height="10">
				<td colspan="7">
					<hr size="2" color="gray" width="800">
				</td>
			</tr>
	<%
		for(int i = 0; i < buylist.size(); i++) {
			buyDTO bdto = buylist.get(i);
	%>
			<tr height="50">
				<td width="50">
					<font size="2"><%=++number%></font>
				</td>
				<td width="50">
					<img alt="" src="img/<%=bdto.getItem_image()%>" height="50">
				</td>
				<td width="100">
					<font size="2"><%=bdto.getItem_name() %></font>
				</td>
				<td width="50">
					<font size="2"><%=bdto.getBuy_count() %></font>
				</td>
				<td width="100">
					<font size="2"><%=bdto.getBuy_price() * bdto.getBuy_count() %></font>
				</td>
				<td width="200">
					<font size="2"><%=bdto.getBuy_date() %></font>
				</td>
				<td width="150">
					<font size="2"><%=bdto.getHowpay() %></font>
				</td>
			</tr>
	<%
		}
	%>
		</table>

</body>
</html>