<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test JSP</title>
</head>
<body>
	<h1>Avec une liste non ordonnée</h1>
	<ul> 
		<% 	
			String[] villes = new String[]{"Rabat", "Salé", "Casablanca", "Fès", "Kénitra" };
			for(int i=0; i <  villes.length; i++){
					out.print("<li>"+villes[i]+"</li>");
			} 
		%>
	</ul>
	<h1>Avec une liste déroulante</h1>
	
	<select> 
		<% 	
			if(request.getParameter("ville") != null){
				String villeSel = request.getParameter("ville");
				for(int i=0; i <  villes.length; i++){
					if(villes[i].equals(villeSel))
						out.print("<option selected>"+villes[i]+"</option>");
					out.print("<option>"+villes[i]+"</option>");
				}
			}
			
			 
		%>
	</select>
</body>
</html>
