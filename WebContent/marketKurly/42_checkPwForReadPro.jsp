<%@page import="market_Kurly.boardDAO"%>
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
	
		int number = Integer.parseInt(request.getParameter("number"));
		String pw = request.getParameter("pw");
		
		int check = boardDAO.getInstance().checkPasswd(number, pw);
		System.out.println(check);
		if(check == 1) {
	%>
		<script type="text/javascript">
			location.href="00_shopMain.jsp?center=35_showBoardContent.jsp?num=<%=number%>";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("비밀번호를 확인하세요.");
			location.href="00_shopMain.jsp?center=35_showBoardContent.jsp?num=<%=number%>";
		</script>
	<%
		}
	%>

</body>
</html>