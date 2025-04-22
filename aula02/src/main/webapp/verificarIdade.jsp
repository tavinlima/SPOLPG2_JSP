<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verificar idade</title>
</head>
<body>
<%
	Integer idade = Integer.parseInt(request.getParameter("idade"));

	if(idade >= 18) out.print("<h1>Acesso permitido</h1>");
	else out.print("<h1>Acesso negado</h1>");
%>
</body>
</html>