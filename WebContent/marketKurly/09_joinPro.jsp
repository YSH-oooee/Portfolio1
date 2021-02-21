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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		int check = -1;
		
		if(check == -1) {
			
			check = cdao.checkOverlapID(id);
			
			if(check == 1) {
	%>
			<script type="text/javascript">
				alert("이미 사용중인 아이디입니다.");
				location.href="00_shopMain.jsp?center=08_join.jsp";
			</script>
	<%
			} else {
				
				check = cdao.checkOverlapEmail(email);
				
				if(check == 2) {
	%>
			<script type="text/javascript">
				alert("이미 사용중인 이메일입니다.");
				location.href="00_shopMain.jsp?center=08_join.jsp";
			</script>
	<%
				} else {
					
					cdao.insertMember(id, pw, name, tel, address, email);
	%>
				<script type="text/javascript">
					alert("회원가입이 완료되었습니다.");
					location.href="00_shopMain.jsp";
				</script>
	<%					
				}
				
			}
			
		}
	%>

</body>
</html>