<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Positif ou negatif</title>
</head>
<body>
	<%
		if(Integer.valueOf(request.getParameter("x"))!=null){
			int x = Integer.valueOf(request.getParameter("x"));
			if(x>=0){
				out.print(x+" est un nombre postif");
			}else{
				response.getWriter().print(x+" est un nombre négatif");
			}
		}
			

	
	%>
</body>
</html>