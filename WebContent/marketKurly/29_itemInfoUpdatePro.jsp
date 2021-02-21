<%@page import="market_Kurly.managerDAO"%>
<%@page import="market_Kurly.itemDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
		String realFolder="";
		String filename="";
		MultipartRequest imageup = null;
	
		String saveFolder="marketKurly/img";
		String encType = "utf-8";
		int max_size=2 * 1024 * 1024;	
	
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("realFolder = " + realFolder);
		
		try{
			imageup = new MultipartRequest(request, realFolder, max_size,encType, new DefaultFileRenamePolicy());
			Enumeration files = imageup.getFileNames();
			
			while(files.hasMoreElements()){
				String name =(String)files.nextElement();
				filename = imageup.getFilesystemName(name);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		int item_number = Integer.parseInt(imageup.getParameter("item_number"));
		
		String item_name = imageup.getParameter("item_name");
		String item_category = imageup.getParameter("item_category");
		String item_price = imageup.getParameter("item_price");
		String item_stock = imageup.getParameter("item_stock");
		String item_info = imageup.getParameter("item_info");
		String discount_rate = imageup.getParameter("discount_rate");
		
		if(item_category.equals("100")) {
			item_category = "채소";
		} else if(item_category.equals("200")) {
			item_category = "해산물";
		} else if(item_category.equals("300")) {
			item_category = "육류";
		} else if(item_category.equals("400")) {
			item_category = "전자제품";
		}
		
		System.out.println("상품명 = " + item_name);
		System.out.println("카테고리 = " + item_category);
		System.out.println("가격 = " + item_price);
		System.out.println("수량 = " + item_stock);
		System.out.println("상품정보 = " + item_info);
		System.out.println("할인율 = " + discount_rate);
		
		itemDTO idto = new itemDTO();

		idto.setItem_name(item_name);
		idto.setItem_category(item_category);
		idto.setItem_price(Integer.parseInt(item_price));
		idto.setItem_stock(Integer.parseInt(item_stock));
		idto.setItem_info(item_info);
		idto.setDiscount_rate(Integer.parseInt(discount_rate));
		
		if(filename != null) {
			idto.setItem_image(filename);
		} else {
			idto.setItem_image("error.jpg");
		}
		
		managerDAO.getInstance().updateItemInfo(idto, item_number);
	%>
	
	<script type="text/javascript">
		alert("상품정보가 수정되었습니다.");
		location.href="00_shopMain.jsp?center=28_itemInfoUpdate.jsp";
	</script>

</body>
</html>