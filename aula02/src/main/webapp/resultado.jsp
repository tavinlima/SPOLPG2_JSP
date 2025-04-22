<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultado</title>
</head>
<body>
<%
	String nome = request.getParameter("nome");

	out.print("Bem vindo, "+ nome +"!");
%>

</body>
</html>