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
	
		ArrayList<itemDTO> allItem = itemDAO.getInstance().getAllItem();
	%>
	
	<table>
		<tr>
			<td width="1000" align="left">
				<button onclick="location.href='00_shopMain.jsp?center=32_insertNewItem.jsp'">신상품 추가하기</button>
			</td>
		</tr>
	</table>
	
	<table border="1" style="border-collapse: collapse;">
		<tr height="50" align="center">
			<td width="50"><b>번호</b></td>
			<td width="100"><b>카테고리</b></td>
			<td width="100"><b>상품명</b></td>
			<td width="100"><b>가격</b></td>
			<td width="50"><b>재고</b></td>
			<td width="50"><b>이미지</b></td>
			<td width="200"><b>상품정보</b></td>
			<td width="50"><b>할인율</b></td>
			<td width="100"><b>등록일</b></td>
			<td width="50"><b>판매량</b></td>
			<td width="100" colspan="2"><b>수정/삭제</b></td>		
		</tr>
	<%
	for(int i = 0; i < allItem.size(); i++) {
		itemDTO idto = allItem.get(i);
	%>
		<tr height="50" align="center">
			<td width="50">		<!-- 번호 -->
				<%=idto.getItem_number() %>
			</td>
			<td width="100">		<!-- 카테고리 -->
	<%
				if(idto.getItem_category().equals("100")) {
	%>
					채소
	<%
				} else if(idto.getItem_category().equals("200")) {
	%>
					해산물
	<%
				} else if(idto.getItem_category().equals("300")) {
	%>
					육류
	<%
				} else if(idto.getItem_category().equals("400")) {
	%>
					전자제품
	<%
				}
	%>
			</td>
			<td width="100">		<!-- 상품명 -->
				<%=idto.getItem_name() %>
			</td>
			<td width="100">		<!-- 가격 -->
				<%=idto.getItem_price() %>
			</td>
			<td width="50">		<!-- 재고 -->
				<%=idto.getItem_stock() %>
			</td>
			<td width="50">		<!-- 이미지 -->
				<img alt="" src="<%=idto.getItem_image() %>" height="50">
			</td>
			<td width="200">		<!-- 상품정보 -->
				<%=idto.getItem_info() %>
			</td>
			<td width="50">		<!-- 할인율 -->
				<%=idto.getDiscount_rate() %>%
			</td>
			<td width="100">		<!-- 등록일 -->
				<%=idto.getReg_date() %>
			</td>
			<td width="50">		<!-- 판매량 -->
				<%=idto.getSold() %>
			</td>
			<td width="50">		<!-- 수정 -->
				<a href="00_shopMain.jsp?center=30_itemInfoUpdateForm.jsp?item_number=<%=idto.getItem_number()%>">수정</a>
			</td>
			<td width="50">		<!-- 삭제 -->
				<a href="31_deleteItem.jsp?item_number=<%=idto.getItem_number()%>">삭제</a>
			</td>
		</tr>
	<%
	}
	%>
	</table>

</body>
</html>