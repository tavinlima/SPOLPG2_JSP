<%@page import="java.util.Arrays"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"% import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<String> listaNomes =  (ArrayList<String>) session.getAttribute("nome");
	
	if (listaNomes == null) {
		listaNomes = new ArrayList<String>();
		session.setAttribute("nomes", listaNomes);
	}

	for(String nome: listaNomes){
		out.print(nome);
	}

%>
</body>
</html>