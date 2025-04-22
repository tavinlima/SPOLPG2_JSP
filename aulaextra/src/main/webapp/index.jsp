<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercícios extras</title>
</head>
<body>
	<h1>Atividades</h1>
	<h2>1 - Escreva uma página JSP que apresente no HTML dois numeros
		inteiros aleatórios com valores entre 1 e 6. Caso a soma dos número
		seja igual a 11 a página deve apresentar no centro da tela a mensagem
		“usuário venceu”, e caso a soma seja diferente de 11 a página deve
		apresentar no centro da tela a mensagem “usuário perdeu”. A página
		deve incluir um link que permite carregar a página novamente
		possibilitando ao usuário jogar quantas vezes quiser.</h2>
	<%
	Random random = new Random();

	Integer num1 = random.nextInt(7);
	Integer num2 = random.nextInt(7);

	out.println("Número 1: " + num1);
	out.println("Número 2: " + num2);

	Integer soma = num1 + num2;

	out.println(soma == 11 ? "usuário venceu" : "usuário perdeu");
	%>
	<a href="index.jsp">Jogar novamente</a>

	<h2>2 – Escreva um código JSP que apresente no HTML uma contagem
		de 1 a 100 utilizando o comando de repetição for</h2>
	<%
	for (int i = 1; i <= 100; i++)
		out.println("Número: " + i);
	%>

	<h2>3 – Escreva um código JSP que apresente no HTML todos números
		pares entre 0 e 1000.</h2>
	<%
	for (int i = 1; i <= 1000; i++)
		if (i % 2 == 0)
			out.println("Número: " + i);
	%>

	<h2>4 – Escreva um código JSP que apresente no HTML uma tabela com
		as datas dos dias até o final do mês vigente. Por exemplo, estamos em
		outubro, então o página deve apresentar uma tabela com as datas até o
		final deste mês.</h2>
	<%
	Calendar hoje = Calendar.getInstance();
	int ano = hoje.get(Calendar.YEAR);
	int mes = hoje.get(Calendar.MONTH); // de 0 a 11
	int diaAtual = hoje.get(Calendar.DAY_OF_MONTH);

	// Último dia do mês atual
	Calendar ultimoDia = Calendar.getInstance();
	ultimoDia.set(Calendar.YEAR, ano);
	ultimoDia.set(Calendar.MONTH, mes);
	ultimoDia.set(Calendar.DAY_OF_MONTH, ultimoDia.getActualMaximum(Calendar.DAY_OF_MONTH));

	SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
	%>

	<table>
		<tr>
			<th>Data</th>
		</tr>
		<%
		while (!hoje.after(ultimoDia)) {
		%>
		<tr>
			<td><%=formatoData.format(hoje.getTime())%></td>
		</tr>
		<%
		hoje.add(Calendar.DAY_OF_MONTH, 1);
		}
		%>
	</table>

	<h2>5 – Escreva um código JSP que apresente no HTML uma tabela com
		os números dos dias no ano referente as datas a partir da data atual
		até o final do ano. Por exemplo, hoje é 8 de outubro é o dia 281
		referente aos 365 dias do ano, então a tabela na primeira linha deve
		apresentar a data 08-10-2024 – 281, em seguida 09-10-2024 – 282, em
		seguida 10-10-2024 – 283, e assim sucessivamente até o final do ano.</h2>

	<%
	Calendar fimDoAno = Calendar.getInstance();
	fimDoAno.set(Calendar.YEAR, ano);
	fimDoAno.set(Calendar.DAY_OF_YEAR, fimDoAno.getActualMaximum(Calendar.DAY_OF_YEAR));
	%>

	<table>
		<tr>
			<th>Data</th>
		</tr>
		<%
		while (!hoje.after(fimDoAno)) {
		%>
		<tr>
			<td>
				<%
				out.println(formatoData.format(hoje.getTime()));
				out.println(" - " + hoje.get(Calendar.DAY_OF_YEAR));
				%>
			</td>
		</tr>
		<%
		hoje.add(Calendar.DAY_OF_MONTH, 1);
		}
		%>
	</table>

	<h2>6 – Escreva uma página JSP que utilize da marcação JSP de
		declaração. Nesta marcação JSP de declaração instânciar um objeto da
		classe ArrayList para armazenar numeros inteiros. Utilizar a marcação
		JSP de scriptlet para incluir dez números no objeto ArrayList. Faça um
		laço de repetição for para apresentar os números armazenados no objeto
		ArrayList. Os números devem ser impressos através da marcação JSP de
		expressão.</h2>
		
	<%!ArrayList<Integer> numeros = new ArrayList<>();%>
	
	<%
		if(numeros.isEmpty()) {
			for(int c =0; c<=10; c++) {
				numeros.add(random.nextInt(15));
			}
		}
	%>
	
	<ul>Números
	<% for(int i = 0; i<numeros.size();i++){  %>
	<li><%=numeros.get(i) %></li>
	<%} %>
	</ul>
</body>
</html>