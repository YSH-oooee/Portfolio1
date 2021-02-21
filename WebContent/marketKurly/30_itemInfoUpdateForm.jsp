<%@page import="market_Kurly.managerDAO"%>
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
	
		int item_number = Integer.parseInt(request.getParameter("item_number"));
		
		itemDTO idto = managerDAO.getInstance().getOneItem(item_number);
	%>
	
	<form action="29_itemInfoUpdatePro.jsp" enctype="multipart/form-data" method="post">
	
		<table border="1" style="border-collapse: collapse;">
			<tr height="30" align="center">
				<td width="150">
					번호
				</td>
				<td width="300">
					<%=idto.getItem_number() %>
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					카테고리
				</td>
				<td width="300">
					<select name="category">
						<option value="100" <%if(idto.getItem_category().equals("100")) {%>selected<%}%>>채소</option>
						<option value="200" <%if(idto.getItem_category().equals("200")) {%>selected<%}%>>해산물</option>
						<option value="300" <%if(idto.getItem_category().equals("300")) {%>selected<%}%>>육류</option>
						<option value="400" <%if(idto.getItem_category().equals("400")) {%>selected<%}%>>전자제품</option>
					</select>
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					상품명
				</td>
				<td width="300">
					<input type="text" name="name" value="<%=idto.getItem_name() %>">
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					가격
				</td>
				<td width="300">
					<input type="text" name="price" value="<%=idto.getItem_price() %>">
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					재고
				</td>
				<td width="300">
					<input type="text" name="stock" size="3" value="<%=idto.getItem_stock() %>">
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					이미지
				</td>
				<td width="300">
					<img alt="" src="img/<%=idto.getItem_image()%>" height="30">
					<input type="file" name="image" value="업로드">
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					상품정보
				</td>
				<td width="300">
					<input type="text" name="info" value="<%=idto.getItem_info() %>">
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					할인율
				</td>
				<td width="300">
					<input type="text" name="discount_rate" size="3" value="<%=idto.getDiscount_rate() %>">%
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					등록일
				</td>
				<td width="300">
					<%=idto.getReg_date() %>
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="150">
					판매량
				</td>
				<td width="300">
					<%=idto.getSold() %>
				</td>
			</tr>
			
			<tr height="30" align="center">
				<td width="450" colspan="2">
					<input type="submit" value="수정하기"> &nbsp;
					<input type="hidden" name="item_number" value="<%=idto.getItem_number() %>">
					<input type="hidden" name="item_category" value="<%=idto.getItem_category()%>">
					<input type="hidden" name="item_name" value="<%=idto.getItem_name()%>">
					<input type="hidden" name="item_price" value="<%=idto.getItem_price()%>">
					<input type="hidden" name="item_stock" value="<%=idto.getItem_stock()%>">
					<input type="hidden" name="item_image" value="<%=idto.getItem_image()%>">
					<input type="hidden" name="item_info" value="<%=idto.getItem_info()%>">
					
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>