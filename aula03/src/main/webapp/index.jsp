<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aula 03</title>
</head>
<body>
	<h2>8. Explique a função dos objetos implícitos request, response,
		session e out em uma página JSP. Dê um exemplo prático de utilização
		para cada um deles.</h2>
	<p><strong>request</strong> - Representa uma requisição que o cliente envia. Permite
		que possamos acessar o conteúdo enviado em um formulário por exemplo.</p>
	<p>String nome = request.getParameter("nomeEnviado");</p>

	<p><strong>response</strong> - É a resposta que será enviada para o cliente da
		requisição que ele fez. Permite por exemplo que redirecionemos o
		cliente para outra página após enviar o formulário</p>
	<p>response.sendRedirect("acertou.jsp")</p>

	<p><strong>session</strong> - Os dados da sessão do usuário - armazenando os dados
		das interações do usuário com a tela temporariamente, como o nome de
		quem está acessando.</p>
	<p>session.setAttribute("nome", nomeQueVeioDoForm)</p>

	<p><strong>out</strong> - Utilizado para mostrar um texto na página. Como um texto
		de boas vindas ao entrar na página.</p>
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