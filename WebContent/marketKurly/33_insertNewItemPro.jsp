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
	
		try {
			
			imageup = new MultipartRequest(request, realFolder, max_size,encType, new DefaultFileRenamePolicy());
			Enumeration files = imageup.getFileNames();
			
			while(files.hasMoreElements()){
				String name =(String)files.nextElement();
				filename = imageup.getFilesystemName(name);
			}	
	
		} catch(Exception e) {
			e.printStackTrace();
		}

		String item_name = imageup.getParameter("name");
		String item_category = imageup.getParameter("category");
		String item_price = imageup.getParameter("price");
		String item_stock = imageup.getParameter("stock");
		String item_info = imageup.getParameter("info");
		String discount_rate = imageup.getParameter("discount_rate");
		
		itemDTO idto = new itemDTO();
		
		idto.setItem_category(item_category);
		idto.setItem_name(item_name);
		idto.setItem_price(Integer.parseInt(item_price));
		idto.setItem_stock(Integer.parseInt(item_stock));
		idto.setItem_info(item_info);
		idto.setDiscount_rate(Integer.parseInt(discount_rate));
		
		if(filename != null){
			idto.setItem_image(filename);
		}else{
			idto.setItem_image("error.jpg");
		}
		
		managerDAO.getInstance().insertNewItem(idto);
		response.sendRedirect("00_shopMain.jsp?center=28_itemInfoUpdate.jsp");
	%>

</body>
</html>