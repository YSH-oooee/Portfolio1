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
	
		itemDAO idao = itemDAO.getInstance();
		
		ArrayList<itemDTO> allItem = idao.getAllItem();
		
		String managerId = (String)session.getAttribute("managerId");
		
		int check = -1;
		
		if(managerId != null) {
			check = 1;
		}
	%>
	
	<div>
	
		<h3>상품 카테고리 검색</h3>
		
		<form action="00_shopMain.jsp?center=17_showOneCategory.jsp" method="post">
			<select name="category">
				<option value="1">채소</option>
				<option value="2">해산물</option>
				<option value="3">육류</option>
				<option value="4">전자제품</option>
			</select>
			
			<input type="image" src="img/findcate.png" name="submit" value="submit" style="width:25px;">	
		</form>
	
	</div>
	
	<hr size="1" color="purple" width="300"> <br>
	
	<h1>전체 상품</h1>
	
	<table>
	<%
		int j = 0;
		for(int i = 0; i < allItem.size(); i++) {
			
			itemDTO bean = allItem.get(i);
			
			if(j % 3 == 0) {
	%>
				<tr height="250">
	<%
			}		
	%>
					<td width="400" align="center">
	<%
						if(check == 1) {
	%>
							<a href="00_shopMain.jsp?center=28_itemInfoUpdate.jsp?item_number=<%=bean.getItem_number()%>
									&item_image=<%=bean.getItem_image()%>">
	<%
								if(bean.getItem_stock() > 0) {
	%>
									<img alt="" src="img/<%=bean.getItem_image()%>" width="250">
	<%
								} else {
	%>
									<img alt="" src="img/<%=bean.getItem_image()%>" width="250" style="opacity: 40%">
	<%
								}
	%>
							</a>
	<%
						} else {
	%>
							<a href="00_shopMain.jsp?center=18_showOneItem.jsp?item_number=<%=bean.getItem_number()%>
									&item_image=<%=bean.getItem_image()%>">
	<%
								if(bean.getItem_stock() > 0) {
	%>
									<img alt="" src="img/<%=bean.getItem_image()%>" width="250">
	<%
								} else {
	%>
									<img alt="" src="img/<%=bean.getItem_image()%>" width="250"  style="opacity: 40%">
	<%
								}
	%>
							</a>
	<%
						}
	%>
						<p><font size="5"><b><%=bean.getItem_name()%></b></font>
	<%
						if(bean.getItem_stock() > 0) {
							
							int price = bean.getItem_price();
							int realPrice = bean.getItem_price() - (bean.getItem_price() * bean.getDiscount_rate() / 100);
							
							if(price == realPrice) {
	%>
								<p><font size="4"><%=bean.getItem_price()%>원</font></p>
	<%
							} else if(price > realPrice) {
	%>
								<p>
									<font size="3"><del><%=bean.getItem_price()%>원</del></font>
									→
									<font size="4" color="purple"><b><%=realPrice%>원</b></font>
								</p>
	<%
							}
	%>
							<p><font size="2"><%=bean.getItem_info()%></font></p>
	<%
						} else {
	%>
							<p><font size="3" color="red"><b>품절</b></font></p>
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