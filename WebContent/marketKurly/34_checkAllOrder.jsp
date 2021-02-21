<%@page import="market_Kurly.managerDAO"%>
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
	
		ArrayList<buyDTO> buylist = managerDAO.getInstance().getAllOrderList();
		
		int number = 0;
	%>
	
	<table border="1" style="border-collapse: collapse;">
		<tr height="50" align="center">
			<td width="50">번호</td>
			<td width="100">아이디</td>
			<td width="100">주문자명</td>
			<td width="100">상품명</td>
			<td width="100">가격</td>
			<td width="100">구매수량</td>
			<td width="50">이미지</td>
			<td width="200">구매일자</td>
			<td width="100">결제수단</td>
			<td width="300">주소</td>
		</tr>
		
	<%
	for(int i = 0; i < buylist.size(); i++) {
		buyDTO bdto = buylist.get(i);
	%>
		<tr height="30" align="center">
			<td width="50"><%=++number %></td>
			<td width="100"><%=bdto.getCustomer_id() %></td>
			<td width="100"><%=bdto.getCustomer_name() %></td>
			<td width="100"><%=bdto.getItem_name() %></td>
			<td width="100"><%=bdto.getBuy_price() %>원</td>
			<td width="100"><%=bdto.getBuy_count() %>개</td>
			<td width="50">
				<img alt="" src="img/<%=bdto.getItem_image() %>" height="50">
			</td>
			<td width="200"><%=bdto.getBuy_date() %></td>
			<td width="100"><%=bdto.getHowpay() %></td>
			<td width="300"><%=bdto.getAddress() %></td>
		</tr>
	<%
	}
	%>
	</table>

</body>
</html>