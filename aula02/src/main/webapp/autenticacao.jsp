<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autenticacao</title>
</head>
<body>
<%
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	if(login.equals("admin") && senha.equals("1234")) out.print("<h1>Login bem-sucedido!</h1>");
	else {
		out.print("<h1>Tente novamente</h1>");
	}
%>
</body>
</html>