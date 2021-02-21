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
	
	<div align="center">
	
		<h1>회원가입</h1>
		<hr color="black" width="700" size="3"> <br>
		
		<form action="09_joinPro.jsp" method="post">
		
			<table>
				<tr height="50">
					<td width="150"><b>아이디</b></td>
					<td width="300" align="center">
						<input type="text" name="id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" style="width:300px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150"><b>비밀번호</b></td>
					<td width="300" align="center">
						<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" style="width:300px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150"><b>이름</b></td>
					<td width="300" align="center">
						<input type="text" name="name" placeholder="이름을 입력해주세요" style="width:300px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150"><b>연락처</b></td>
					<td width="300" align="center">
						<input type="text" name="tel" placeholder="연락처를 입력해주세요" style="width:300px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150"><b>주소</b></td>
					<td width="300" align="center">
						<input type="text" name="address" placeholder="주소를 입력해주세요" style="width:300px; height:30px;">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150"><b>이메일</b></td>
					<td width="300" align="center">
						<input type="email" name="email" placeholder="예: marketKurly@kurly.com" style="width:300px; height:30px;">
					</td>
				</tr>
				
			</table>
			<br>
			<table>
				<tr height="50">
					<td colspan="2" align="center">
						<input type="image" src="img/gotoJoinPro.PNG" name="submit" value="submit"
								style="height:50px;">
					</td>
				</tr>
			</table>
		
		</form>
	
	</div>

</body>
</html>