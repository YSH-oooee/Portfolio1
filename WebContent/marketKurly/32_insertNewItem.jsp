<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="33_insertNewItemPro.jsp" method="post" enctype="multipart/form-data">
		
		<table border="1" style="border-collapse: collapse;">
			<tr height="30">
				<td width="200">상품 카테고리</td>
				<td width="500">
					<select name="category">
						<option value="100">채소</option>
						<option value="200">해산물</option>
						<option value="300">육류</option>
						<option value="400">전자제품</option>
					</select>
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">상품명</td>
				<td width="500">
					<input type="text" name="name">
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">판매가</td>
				<td width="500">
					<input type="text" name="price">원
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">수량</td>
				<td width="500">
					<input type="text" name="stock">
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">이미지</td>
				<td width="500">
					<input type="file" name="image">
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">상품정보</td>
				<td width="500">
					<input type="text" name="info" size="50">
				</td>
			</tr>
			
			<tr height="30">
				<td width="200">할인율</td>
				<td width="500">
					<input type="text" name="discount_rate">%
				</td>
			</tr>
		</table>
		
		<input type="submit" value="상품 추가하기">
		
	</form>

</body>
</html>