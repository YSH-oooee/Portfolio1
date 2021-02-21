<%@page import="market_Kurly.managerDAO"%>
<%@page import="market_Kurly.managerDTO"%>
<%@page import="market_Kurly.buyDAO"%>
<%@page import="market_Kurly.customerDTO"%>
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
		
		//세션에서 받아온 id로 buyDAO에서 불러온 고객 정보를 customerbean에 저장
		//세션에서 받아온 managerId로 managerDAO에서 불러온 관리자 정보를 managerbean에 저장
		customerDTO customerbean = buyDAO.getInstance().getCustomerInfo(id);
		managerDTO managerbean = managerDAO.getInstance().getManagetInfo(managerId);
		
		String name = "";
	%>
	<%-- 로그인 및 고객센터 등 --%>
	<div align="right">
		<font size="2">
	<%		//로그인이 되어있지 않음
			if(id == null && managerId == null) {
	%>
				<a href="00_shopMain.jsp?center=08_join.jsp" style="text-decoration: none">회원가입</a> &nbsp;
				<img alt="" src="img/top1.jsp"> &nbsp;
				<a href="00_shopMain.jsp?center=04_customerLogin.jsp" style="text-decoration: none">로그인</a> &nbsp;
	<%
			} else {
				//회원 로그인
				if(id != null) {
					
					name = customerbean.getName();
					System.out.println("로그인 : " + name);
	%>
					<%=name%>님 &nbsp;
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href="00_shopMain.jsp?center=24_orderListCheck.jsp" style="text-decoration: none">주문확인</a>
	<%
				//관리자 로그인
				} else if(managerId != null) {
					
					name = managerbean.getName();
	%>
					<%=name%>님 &nbsp;
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href="00_shopMain.jsp?center=28_itemInfoUpdate.jsp" style="text-decoration: none">상품수정</a> &nbsp;
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href="00_shopMain.jsp?center=34_checkAllOrder.jsp" style="text-decoration: none">주문확인</a> &nbsp;
	<%					
				}				
	%>
				<img alt="" src="img/top1.jpg"> &nbsp;
				<a href="06_logout.jsp" style="text-decoration: none">로그아웃</a> &nbsp;
	<%
			}
			//로그인에 관계없이 고객센터는 고정
	%>
			<img alt="" src="img/top1.jpg"> &nbsp;
			<a href="00_shopMain.jsp?center=07_customerCenter.jsp" style="text-decoration: none">고객센터</a>
		</font>
	</div>
	
	<%-- 상단메뉴 --%>
	<div align="center">
		
		<a href="00_shopMain.jsp">
			<img alt="" src="img/logo.png" height="80">
		</a>
	
		<table>
			<tr height="50" align="center">
				<td width="180" id="dropdown">
					<font size="3" color="black">
						<a href="00_shopMain.jsp?center=16_showAllCategory.jsp" style="text-decoration: none">
							<b>전체상품보기</b>
						</a>
					</font>
				</td>
				<td width="10">
					<img alt="" src="img/top1.jpg">
				</td>
				<td width="180">
					<font size="3" color="black">
						<a href="00_shopMain.jsp?center=25_showNewItem.jsp" style="text-decoration: none">
							<b>신상품</b>
						</a>
					</font>
				</td>
				<td width="10">
					<img alt="" src="img/top1.jpg">
				</td>
				<td width="180">
					<font size="3" color="black">
						<a href="00_shopMain.jsp?center=26_showBestItem.jsp" style="text-decoration: none">
							<b>베스트</b>
						</a>
					</font>
				</td>
				<td width="10">
					<img alt="" src="img/top1.jpg">
				</td>
				<td width="180">
					<font size="3" color="black">
						<a href="00_shopMain.jsp?center=27_showDiscountedItem.jsp" style="text-decoration: none">
							<b>알뜰상품</b>
						</a>
					</font>
				</td>
				<td width="10">
					<img alt="" src="img/top1.jpg">
				</td>
				<td width="180">
					<font size="3" color="black">
						<a href="#" style="text-decoration: none"><b>이벤트</b></a>
					</font>
				</td>
				<td width="40">
					<a href="00_shopMain.jsp?center=19_cartInfo.jsp">
						<img alt="" src="img/cart.png" width="30">
					</a>
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>