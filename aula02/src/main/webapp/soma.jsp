<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soma</title>
</head>
<body>
	<%
	Integer num1 = Integer.parseInt(request.getParameter("num1"));
	Integer num2 = Integer.parseInt( request.getParameter("num2"));

	out.print("A soma é: "+ (num1 + num2) );
%>
</body>
</html>