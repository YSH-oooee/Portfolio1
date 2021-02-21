<%@page import="market_Kurly.customerDAO"%>
<%@page import="market_Kurly.managerDAO"%>
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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int check = managerDAO.getInstance().checkManager(id, pw);
		
		//먼저 관리자 id인지 확인 >> 맞으면 관리자 로그인, 아니면 회원 id 체크
		if(check == 1) {
			
			session.setAttribute("managerId", id);
			response.sendRedirect("00_shopMain.jsp");
			
		} else {
			
			check = customerDAO.getInstance().checkUser(id, pw);
			
			if(check == 1) {
				session.setAttribute("id", id);
				response.sendRedirect("00_shopMain.jsp");
			}
	%>
		<script type="text/javascript">
			alert("아이디와 비밀번호를 확인하세요.");
			history.go(-1);
		</script>
	<%
		}
	%>

</body>
</html>