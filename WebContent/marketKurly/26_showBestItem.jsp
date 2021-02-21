<%@page import="market_Kurly.itemDAO"%>
<%@page import="market_Kurly.itemDTO"%>
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
	
		ArrayList<itemDTO> bestlist = itemDAO.getInstance().getBestItem();
	%>
	
	<h1>BEST</h1>
	
	<font size="2" color="purple">*주문량 BEST3*</font> <br><br>
	
	<table>
	<%
		int j = 0;
		for(int i = 0; i < bestlist.size(); i++) {
			itemDTO idto = bestlist.get(i);
			
			if(j % 3 == 0) {
	%>
				<tr height="250">
	<%
			}
	%>
					<td width="400" align="center">
						<a href="00_shopMain.jsp?center=18_chowOneItem.jsp?item_number=<%=idto.getItem_number()%>
						&item_image=<%=idto.getItem_image()%>">
	<%
						if(idto.getItem_stock() > 0) {
	%>
							<img alt="" src="img/<%=idto.getItem_image()%>" width="250">
	<%
						} else {
	%>
							<img alt="" src="img/<%=idto.getItem_image()%>" width="250" style="opacity: 40%;">
	<%
						}
	%>
						</a>
						<p><font size="5"><b><%=idto.getItem_name()%></b></font></p>
	<%
					if(idto.getItem_stock() > 0) {
						int price = idto.getItem_price();
						int realprice = idto.getItem_price() - idto.getItem_price() * idto.getDiscount_rate() / 100;
						
						if(price == realprice) {
	%>
							<p><font size="4"><%=idto.getItem_price() %>원</font></p>
	<%
						} else if(price > realprice) {
	%>
							<p><font size="3"><%=idto.getItem_price() %>원</font>
							→
							<font size="4" color="purple"><b><%=realprice %>원</b></font></p>
	<%
						}
	%>
						<p><font size="2"><%=idto.getItem_info() %></font></p>
	<%
					} else {
	%>
						<p><font size="3"color="red"><b>품절</b></font></p>
	<%
					}
	%>
					</td>
	<%
			j += 1;
		}
	%>
	</table>

</body>
</html>