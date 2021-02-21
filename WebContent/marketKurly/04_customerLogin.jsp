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
	
	<form action="05_customerLoginPro.jsp" method="post">
		
		<table>
			<tr align="center" height="70">
				<td width="300">
					<h2>로그인</h2>
				</td>
			</tr>
			
			<tr align="center" height="50">
				<td width="300">
					<input type="text" name="id" placeholder="아이디를 입력하세요"
							style="width:300px; height:30px; color:gray;" onfocus="this.style.color='black';">
				</td>
			</tr>
			
			<tr align="center" height="50">
				<td width="300">
					<input type="password" name="pw" placeholder="비밀번호를 입력하세요"
							style="width:300px; height:30px; color:gray;" onfocus="this.style.color='black';">
				</td>
			</tr>
			
			<tr align="right" height="50">
				<td width="300">
					<font size="2" color="gray">
						<a href="00_shopMain.jsp?center=10_filndMemberId.jsp" style="text-decoration: none">
							아이디찾기
						</a>
					</font>
					<img alt="" src="img/top1.jpg">
					<font size="2" color="gray">
						<a href="00_shopMain.jsp?center=10_filndMemberPw.jsp" style="text-decoration: none">
							비밀번호찾기
						</a>
					</font>
				</td>
			</tr>
			
			<tr height="50" align="center">
				<td width="300">
					<input type="image" src="img/login.PNG" name="submit" value="submit">
				</td>
			</tr>
			
			<tr height="50" align="center">
				<td width="300">
					<input type="image" src="img/join.PNG" onclick="location.href='00_shopMain.jsp?center=08_join.jsp'">
				</td>
			</tr>
		</table>
		
	</form>

</body>
</html>