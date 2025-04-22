<%@page import="java.util.Collections"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Queue"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Aula 04</title>
</head>
<body>
	<h2>Exercício 1: Contador Global de Acessos com application Crie
		uma página JSP que registre o número total de acessos ao site
		utilizando o objeto implícito application. Toda vez que a página for
		acessada, o contador deve ser incrementado. Mostre o número de acessos
		na tela. Desafio adicional: Inclua também a data/hora da última visita
		(use application.setAttribute com LocalDateTime).</h2>

	<%
	Integer contador = (Integer) application.getAttribute("acessos");

	if (contador == null) {
		contador = 0;
	}
	contador++;

	application.setAttribute("acessos", contador);

	long lastVisitSession = session.getLastAccessedTime();

	LocalDateTime lastVisit = Instant.ofEpochMilli(lastVisitSession).atZone(ZoneId.systemDefault()).toLocalDateTime();
	;

	String horaAcesso = (String) application.getAttribute("horaAcesso");

	application.setAttribute("horaAcesso", lastVisit.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss")));
	%>

	<h2>
		Visitantes:
		<%=contador%>
	</h2>

	<h2>
		Última visita :
		<%=horaAcesso%>
	</h2>

	<h2>Exercício 2: Encaminhamento Condicional com request,
		pageContext e config Crie uma página JSP que leia um parâmetro chamado
		"destino" da requisição (request.getParameter("destino")) e,
		dependendo do valor, encaminhe para uma das seguintes páginas: •
		"produtos" → produtos.jsp • "contato" → contato.jsp • Qualquer outro
		valor → erro.jsp Utilize o método pageContext.forward() para fazer o
		redirecionamento interno sem mudar a URL.</h2>
	<%
	String typePage = request.getParameter("destino");

	out.print(typePage);

	if (typePage != null) {
		if (typePage.equals("contato")) {
			pageContext.forward("pages/contato.jsp");
		} else if (typePage.equals("produto")) {
			pageContext.forward("pages/produtos.jsp");
		} else {
			pageContext.forward("pages/error.jsp");
		}

	}
	%>

	<form method="get">
		<label> Digite a página que deseja ser redirecionado: <input
			type="text" name="destino">
			<button>enviar</button>
		</label>
	</form>


	<h2>Exercício 3: Registro de Ações de Usuário com session e
		request Monte um sistema simples onde cada vez que o usuário executa
		uma ação (simulada por um link ou botão), você registra essa ação em
		uma lista armazenada na session. Exiba essa lista na mesma página,
		mostrando o histórico do que o usuário fez durante a sessão. Desafio
		adicional: Use o escopo request para armazenar a última ação executada
		e destacá-la no topo da lista.</h2>

	<%
	String cor = request.getParameter("cor");

	Queue<String> fila = (Queue<String>) session.getAttribute("acoes");

	if (fila == null) {
		fila = new LinkedList<String>();
		session.setAttribute("acoes", fila);
	}

	if (cor != null) {
		fila.add(cor);
	}
	LinkedList<String> reverseFila = new LinkedList<>(fila);

	Collections.reverse(reverseFila);
	%>

	<form method="post" accept-charset="UTF-8">
		<button name="cor" id="verm" value="apertou button vermelho">Botão
			vermelho</button>
		<button name="cor" id="azul" value="apertou button azul">Botão
			azul</button>
		<button name="cor" id="verd" value="apertou button verde">Botão
			verde</button>
	</form>

	<ul>
		<%
		for (int c = 0; c < reverseFila.size(); c++) {
			if (c == 0) {
		%>
		<li><strong><%=reverseFila.get(c)%> </strong></li>
		<%
		}

		else {
		%>
		<li><%=reverseFila.get(c)%></li>
		<%
		}

		}
		%>
	</ul>
	
	<%
		String opcaoFundo = request.getParameter("backColor");
	
		String opcaoFonte = request.getParameter("fontSize");
	
		if(opcaoFundo !=null && opcaoFonte != null) {
			session.setAttribute("backColor", opcaoFundo);
			session.setAttribute("fontSize", opcaoFonte + "px");
		}
		
		String opcaoFundoSessao = (String) session.getAttribute("backColor");
		String opcaoFonteSessao = (String) session.getAttribute("fontSize");
		
		if(opcaoFundoSessao == null) opcaoFundoSessao = "#ffffff";
		
		if (opcaoFonteSessao == null) opcaoFonteSessao = "16px";
		
		pageContext.setAttribute("backColor", opcaoFundoSessao);
		pageContext.setAttribute("fontSize", opcaoFonteSessao);
	%>
	
	<style>
	body {
	background-color: <%= pageContext.getAttribute("backColor")%>;
	}
	
	h2 {
	font-size: <%= pageContext.getAttribute("fontSize") %>
	}
	</style>

	<h2>Exercício 4: Formulário de Preferências com session e
		pageContext. Crie uma página com um formulário onde o usuário escolhe
		uma cor de fundo e um tamanho de fonte. Ao submeter: 1. Salve as
		preferências na session. 2. Use pageContext para aplicar as
		preferências no CSS embutido da página. 3. O estilo deve persistir
		enquanto a sessão estiver ativa.</h2>
		
		<form method="get">
		<label>Cor de fundo:
		<input type="text" name="backColor">
		</label>
		
		<label>Tamanho do h2
		<input type="number" name="fontSize">
		</label>
		
		<button>Enviar</button>
		</form>
</body>
</html>
