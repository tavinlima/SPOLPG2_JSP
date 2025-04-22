<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- %@page import="ifsp.Dentista"%> -->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Aula 02</title>
</head>
<body>

	<h2>Objetivo: Criar um formulário que receba o nome do usuário e
		exiba uma mensagem de boas- vindas em uma página JSP.</h2>


	<form action="resultado.jsp" method="get">
		<label>Insira seu nome</label> <input type="text" name="nome">

		<button type="submit">Enviar</button>
	</form>

	<h2>Objetivo: Criar um formulário com dois campos numéricos.
		Quando o usuário enviar, uma página JSP deve capturar os valores com
		request.getParameter() e exibir a soma.</h2>

	<form action="soma.jsp" method="get">
		<label> Insira o primeiro número <input type="number"
			name="num1">
		</label> <label>Insira o segundo número <input type="number"
			name="num2">
		</label>
		<button>Enviar</button>
	</form>

	<h2>Objetivo: Criar uma página com um campo para o usuário digitar
		a idade. A página JSP deve verificar se o usuário é maior de idade (18
		anos) e mostrar uma mensagem de "acesso permitido" ou "acesso negado".</h2>
</body>
<form action="verificarIdade.jsp" method="get">
	<label>Insira sua idade <input type="number" name="idade"></label>

	<button type="submit">Enviar</button>
</form>

<h2>Objetivo: Criar um formulário com checkbox para vários
	interesses (ex: música, esportes, leitura). Na página JSP, use
	request.getParameterValues() para capturar as opções selecionadas e
	exibi-las na tela.</h2>
Exemplo: Entrada: Esportes e Leitura Saída: "Seus interesses: Esportes,
Leitura"

<form action="interesses.jsp" method="get">
	<label> música <input type="checkbox" name="interesse"
		value=musica>
	</label> <label> esportes <input type="checkbox" name="interesse"
		value=esportes>
	</label> <label> leitura <input type="checkbox" name="interesse"
		value=leitura>
	</label>

	<button type="submit">Enviar</button>
</form>

<h2>Objetivo: Criar um formulário com campos de login e senha. Na
	página JSP, compare os valores recebidos com um par fixo de login/senha
	(ex: admin/1234). Exiba uma mensagem de sucesso ou erro</h2>

<form action="autenticacao.jsp" method="post">
	<table>
		<tr>
			<td>login</td>
			<td><input type="text" name="login"></td>
		</tr>
		<tr>
			<td>senha</td>
			<td><input type="password" name="senha"></td>
		</tr>

		<tr>
			<td>
				<button type="submit">Enviar</button>
			</td>
		</tr>
	</table>
</form>

<%
ArrayList<String> listaNomes = (ArrayList<String>) session.getAttribute("listaNomes");

if (listaNomes == null) {
	listaNomes = new ArrayList<String>();
	session.setAttribute("listaNomes", listaNomes);
}

String novoNome = request.getParameter("nome");
if (novoNome != null)
	listaNomes.add(novoNome);
%>

<h2>
	Objetivo: Crie um formulário JSP onde o usuário pode cadastrar nomes. A
	cada novo envio, o nome é adicionado a um ArrayList
	<String> e todos os nomes cadastrados são exibidos na tela.
</h2>

<form>
	<label> Insira um nome <input type="text" name="nome">
	</label>

	<button type="submit">Enviar</button>

	<%
	for (String nome : listaNomes) {
	%>
	<p><%=nome%></p>
	<%
	}
	%>
</form>

</body>
</html>