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
	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String id = cdao.findID(name, email);
		
		if(id != null) {
	%>
		<script type="text/javascript">
			alert("회원님의 아이디는 <%=id%> 입니다.");
			location.href="00_shopMain.jsp?center=04_customerLogin.jsp";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("해당하는 회원정보가 존재하지 않습니다.");
			history.go(-1);
		</script>
	<%
		}
	%>

</body>
</html>