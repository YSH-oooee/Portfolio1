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
		String managerId = (String)session.getAttribute("managerId");
	%>
	
	<form action="37_writePro.jsp" method="post">
	
		<table border="1" style="border-collapse: collapse;">
			<tr height="50">
				<td width="200" align="center"><b>작성자</b></td>
				<td width="400">
					<input type="text" name="writer" size="20">
				</td>
			</tr>
			
			<tr height="50">
				<td width="200" align="center"><b>제목</b></td>
				<td width="400">
					<input type="text" name="title" size="50">
				</td>
			</tr>
			
			<tr height="50">
				<td width="200" align="center"><b>비밀번호</b></td>
				<td width="400">
					<input type="password" name="pw" size="20">
				</td>
			</tr>
			
			<tr height="150">
				<td width="200" align="center"><b>글내용</b></td>
				<td width="400">
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>
			</tr>
		</table> <br>
		
		<input type="submit" value="글쓰기"> &nbsp;
		<input type="reset" value="다시작성">
	
	</form>

</body>
</html>