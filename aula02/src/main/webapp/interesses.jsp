<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interesses</title>
</head>
<body>
<%
	String[] interesses = request.getParameterValues("interesse");

	out.print("Seus interesses são: ");
	for(int i=0;i <interesses.length;i++) {
		out.print(interesses[i] + ", ");
	}
%>
</body>
</html>