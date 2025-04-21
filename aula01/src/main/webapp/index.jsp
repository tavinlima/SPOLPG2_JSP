<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página de aprendizado para Java Web</title>
</head>
<body>
	<h1>Java Web</h1>
	<div>
		<h2>O que é Java Web</h2>
		<p>Aplicações Web construídas em Java</p>
	</div>
	<div>
		<h2>O que é JSP:</h2>
		<p></p>
	</div>
	<div>
		<h2>O que é serverlet:</h2>
		<p></p>
	</div>

	<h2>
		Quais são os principais métodos da interface Collection e quais são as
		diferenças entre as implementações ArrayList e LinkedList? <br>Qual
		a funcionalidade dos seguintes métodos das interfaces Collections:
		sort, binarySearch, reverse, shuffle, fill e copy:
	</h2>
	<p>
		Set, List e Queue. <br>Set: Os elementos não possuem ordem e não
		podem ser duplicados <br>List: Os elementos possuem ordem e podem
		ser duplicados. <br>Queue: Representa uma fila, podendo ser
		utilizada com a organização FIFO ou LIFO - usada para processar itens
		de acordo com a ordem de chegada <br> <br>A diferença entre
		ArrayList e LinkedList: <br>A diferença está entre a ligação dos
		elementos. Enquanto o ArrayList guarda a ligação de seu elemento com o
		próximo, o LinkedList guarda a ligação entre o elemento com próximo e
		o elemento com o anterior. Então, por exemplo, para percorrer um
		ArrayList, o array irá buscar sempre o próximo item da até chegar no
		resultado esperado, enquanto o LinkedList pode buscar também os
		elementos anteriores.
	</p>
	<p>
		<br>Vamos utilizar a lista a seguir como exemplo: números: 50, 40, 450, 56, 35, 10 
		<br>Para implementar: List<Integer> numeros = new ArrayList<>(Arrays.asList(50, 40, 450, 56, 35, 10));
		<br>
		
		<br>sort - ordena os elementos em ordem crescente/alfabética: 
		<br>Ex: Collections.sort(numeros);
		<br>
		<%
		List<Integer> numeros = new ArrayList<>(Arrays.asList(50, 40, 450, 56, 35, 10));

		for (Integer num : numeros) {
			out.println(num);
		}

		Collections.sort(numeros);

		out.println("Após ordenação: ");

		for (Integer num : numeros) {
			out.println(num);
		}
		%>
		<br> 
		
		<br>binarySearch - Realiza uma busca binária para encontrar o índice do elemento informado no array:
		<br> Ex: Collections.binarySearch(numeros, 50)
		<br>
		<%
		out.println("Resultado: " + Collections.binarySearch(numeros, 50));
		%>
		<br> 
		
		<br>reverse - Inverte a ordem da lista
		<br> Ex: Collections.reverse(numeros)
		<br>
		<%
		out.println("Array original: ");
		for (Integer num : numeros) {
			out.println(num);
		}

		Collections.reverse(numeros);

		out.println("Após reverse: ");

		for (Integer num : numeros) {
			out.println(num);
		}
		%>
		<br> 
		
		<br>copy - copia os elementos de uma lista para outra, desde que o destino tenha um tamanho maior ou igual:
		<br> Ex: List<Integer> copia = new ArrayList<>(Arrays.asList(0,0,0,0,0,0));
		<br> Collections.copy(copia, numeros);
		<br>
		<%
		List<Integer> copia = new ArrayList<>(Arrays.asList(0,0,0,0,0,0));
		
		out.println("Array original: ");
		for (Integer num : numeros) {
			out.println(num);
		}

		Collections.copy(copia, numeros);

		out.println("Array Copy: ");

		for (Integer num : copia) {
			out.println(num);
		}
		%>
		<br>
		
		<br>shuffle - embaralha aleatoriamente a lista:
		<br> Ex: Collections.shuffle(numeros);
		<br>
		<%
		out.println("Array original: ");
		for (Integer num : numeros) {
			out.println(num);
		}

		Collections.shuffle(numeros);

		out.println("Após shuffle: ");

		for (Integer num : numeros) {
			out.println(num);
		}
		%>
		<br> 
		
		<br>fill - substitui a lista por um elemento fornecido: 
		<br> Ex: Collections.fill(copia, 63);
		<br>
		<%
		out.println("Array original: ");
		for (Integer num : copia) {
			out.println(num);
		}

		Collections.fill(copia, 63);

		out.println("Após fill: ");

		for (Integer num : copia) {
			out.println(num);
		}
		%>
				
	</p>
</body>
</html>