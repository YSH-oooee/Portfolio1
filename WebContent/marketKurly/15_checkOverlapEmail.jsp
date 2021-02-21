<%@page import="market_Kurly.customerDAO"%>
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
	
		customerDAO cdao = customerDAO.getInstance();
		
		String email = request.getParameter("email");
		
		int check = cdao.checkOverlapEmail(email);
		
		if(check == 1) {
	%>
		<script type="text/javascript">
			alert("중복된 이메일입니다.");
			history.go(-1);
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("사용 가능한 이메일입니다.");
			location.href="00_shopMain.jsp?center=08_join.jsp";
		</script>
	<%
		}
	%>

</body>
</html>