<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aula 03</title>
</head>
<body>
	<h2>
		5. Exercício: Personalização de Cor com Sessão Descrição: <br>•
		Crie uma página JSP com um formulário para o usuário escolher a cor de
		fundo do site. <br>• Salve essa cor escolhida na sessão. <br>•
		A cada vez que a página for carregada, pegue a cor salva na sessão e
		aplique como background da página.
	</h2>

	<%
	String fundoEscolhido = request.getParameter("backColor");

	if (fundoEscolhido != null)
		session.setAttribute("backgroundColor", fundoEscolhido);
	%>

	<style>
body {
	background-color: <%=session.getAttribute("backgroundColor")%>
}
</style>

	<form method="get">
		<label> Escolha a cor de fundo do site: <input
			name="backColor" type="text">
		</label>

		<button>Enviar</button>
	</form>

	<h2>7. Calculadora Simples com Request</h2>
	<p>
		Objetivo: <br>Criar uma página JSP que recebe dois números e uma
		operação escolhida pelo usuário (soma, subtração, multiplicação ou
		divisão), e exibe o resultado. <br> Instruções: <br>1. Crie
		um formulário HTML dentro da JSP com campos: <br>• Número 1
		(input) <br>• Número 2 (input) <br>• Operação (select: +, -,
		*, /) <br>2. Ao enviar, a mesma JSP recebe os dados via POST e
		faz o cálculo. <br>3. Exibe o resultado ao usuário usando
		request.getParameter().
	</p>

	<%
	String operacao = request.getParameter("operacao");

	Double result = 0.0;

	String n1 = request.getParameter("num1");
	String n2 = request.getParameter("num2");

	if (n1 != null && n2 != null && operacao != null) {
		Double num1 = Double.parseDouble(n1);
		Double num2 = Double.parseDouble(n2);

		if (operacao != null) {
			switch (operacao) {
			case "+":
		result = num1 + num2;
		break;
			case "-":
		result = num1 - num2;
		break;
			case "*":
		result = num1 * num2;
		break;
			case "/":
		if (num2 != 0) {
			result = num1 / num2;
		} else {
			out.println("Erro: Divisão por zero.");
		}
		break;
			default:
		out.println("Operação inválida.");
			}
		}
	}
	%>

	<form method="post">
		<label>Insira o número 1: <input type="number" name="num1"></label>

		<label>Insira o número 2: <input type="number" name="num2"></label>

		<label>Insira a operação (- ou + ou / ou *): <input
			type="text" name="operacao"></label>

		<%
		if (result != null) {
		%>
		<p>
			Resultado: <strong><%=result%></strong>
		</p>
		<%
		}
		%>

		<button>Enviar</button>
	</form>

	<h2>8. Explique a função dos objetos implícitos request, response,
		session e out em uma página JSP. Dê um exemplo prático de utilização
		para cada um deles.</h2>
	<p>
		<strong>request</strong> - Representa uma requisição que o cliente
		envia. Permite que possamos acessar o conteúdo enviado em um
		formulário por exemplo.
	</p>
	<p>String nome = request.getParameter("nomeEnviado");</p>

	<p>
		<strong>response</strong> - É a resposta que será enviada para o
		cliente da requisição que ele fez. Permite por exemplo que
		redirecionemos o cliente para outra página após enviar o formulário
	</p>
	<p>response.sendRedirect("acertou.jsp")</p>

	<p>
		<strong>session</strong> - Os dados da sessão do usuário - armazenando
		os dados das interações do usuário com a tela temporariamente, como o
		nome de quem está acessando.
	</p>
	<p>session.setAttribute("nome", nomeQueVeioDoForm)</p>

	<p>
		<strong>out</strong> - Utilizado para mostrar um texto na página. Como
		um texto de boas vindas ao entrar na página.
	</p>
	<p>out.print("Bem vindo!")</p>


	<h2>9. Quais são as diferenças entre os objetos request e session
		no ciclo de vida de uma aplicação web? Explique quando é mais
		apropriado usar cada um deles em uma aplicação JSP.</h2>
	<p>
		A request é utilizada para acessar dados de uma requisição que foi
		enviada (como um nome enviado em um formulário). <br>Já a session
		representa toda a interação que o usuário teve na tela, ficando lá
		enquanto o usuário estiver na página ou solicitar a exclusão, como um
		token de login
	</p>

	<h2>10. O que acontece se tentarmos acessar um atributo salvo na
		session sem antes verificar se ele existe? Qual a boa prática
		recomendada para evitar erros em JSP? Dê um exemplo.</h2>
	<p>
		A página retornará um erro pois não conseguirá achar o atributo
		solicitado. <br>Uma boa prática é verificar se o atributo existe
		(se é diferente de null, antes de acessá-lo)
	</p>
	<p>
		Exemplo: <br>String nome = (String) session.getAttribute("nome");
		<br> <br>if (nome != null) { <br> out.print("Bem-vindo,
		" + nome); <br>} else { <br> out.print("Usuário não
		logado."); <br>}
	</p>

</body>
</html>