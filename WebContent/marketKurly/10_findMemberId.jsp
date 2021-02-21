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
	%>
	
	<form action="11_findMemberIdPro.jsp" method="post">
	
		<table>
			<tr height="70" align="center">
				<td width="300">
					<h2>아이디 찾기</h2>
				</td>
			</tr>
			
			<tr height="10">
				<td width="300">
					<font size="2"><b>이름</b></font>
				</td>
			</tr>
			
			<tr height="50" align="center">
				<td width="300">
					<input type="text" name="name" style="width:300px; height:30px; color: gray;" 
							value="이름을 입력해주세요" onfocus="this.value=''">
				</td>
			</tr>
			
			<tr height="10">
				<td width="300">
					<font size="2"><b>이메일</b></font>
				</td>
			</tr>
			
			<tr height="50" align="center">
				<td width="300">
					<input type="email" name="email" style="width:300px; height:30px; color: gray;" 
						value="가입 시 등록하신 이메일을 입력해주세요" onfocus="this.value=''">
				</td>
			</tr>
			
			<tr height="10">
				<td width="300">
					<font size="2"><b></b></font>
				</td>
			</tr>
			
			<tr height="50" align="center">
				<td width="300">
					<input type="image" src="img/find.PNG" name="submit" value="submit" style="width:310px;">
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>