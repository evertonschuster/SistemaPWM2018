<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Cliente"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionCliente"%>
<%
	Cliente clienteFilter = (Cliente) request.getSession().getAttribute("filterCliente");
	if (clienteFilter == null) {
		clienteFilter = new Cliente();
	}

	Object list[] = (Object[]) request.getAttribute("list");
	if (list == null) {
		list = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="./css/styles.css" />
<title>Consultar Cliente</title>
<script type="text/javascript" src="./scripts/cliente.js"></script>
</head>
<body>
	<div class="titulo">Consultar Cliente</div>
	<div class="divFields">
		<!-- 
			Formulário é um elemento não visual que engloba os inputs passivos
			de serem enviados ao servidor.
			Para input, select ou text-area ser enviado ao servidor ele deve:
			- Estar dentro do form que for executar o submit
			- Possuir setada a propriedade name
			- Não estar DISABLED
		 -->
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="id" name="id"> <input type="hidden"
				id="newAction" name="newAction"> <input type="hidden"
				id="entityName" name="entityName" value="Cliente" />
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField">
					<input
						value="<%=(clienteFilter.getIdCliente() == null) ? "" : clienteFilter.getIdCliente()%>"
						class="inputText" type="text" id="idCliente" name="idCliente" />
				</div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField">
					<input
						value="<%=(clienteFilter.getNome() == null) ? "" : clienteFilter.getNome()%>"
						class="inputText" type="text" id="Nome" name="descricao"
						style="width: 320px;" />
				</div>
			</div>
			<div>
				<div class="divLabel">CPF:</div>
				<div class="divField">
					<input
						value="<%=(clienteFilter.getCPF() == null) ? "" : clienteFilter.getCPF()%>"
						class="inputText" type="text" id="CPF" name="descricao"
						style="width: 320px;" />
				</div>
			</div>
			<div>
				<div class="divLabel">RG:</div>
				<div class="divField">
					<input
						value="<%=(clienteFilter.getRG() == null) ? "" : clienteFilter.getRG()%>"
						class="inputText" type="text" id="RG" name="descricao"
						style="width: 320px;" />
				</div>
			</div>

		</form>
		<div class="divButtons">
			<input type="button" class="button" id="btx" value="Consultar" onclick="find();" /> 
			<input type="button" class="button"	value="Limpar" onclick="clean();" /> 
			<input type="button" class="button" value="Novo" onclick="goNew();" />
		</div>
	</div>
	<div class="divTable">
		<table class="table" cellpadding="0" cellspacing="0">
			<tr>
				<th style="width: 50px;">Código</th>
				<th>Nome</th>
				<th>CPF</th>
				<th>RG</th>
				<th>Email</th>
				<th style="width: 50px;">&nbsp;</th>
			</tr>
			<%
				for (int i = 0; i < list.length; i++) {
					Cliente cliente = (Cliente) list[i];
			%>
			<tr>
				<td><%=cliente.getIdCliente()%></td>
				<td><%=cliente.getNome()%></td>
				<td><%=cliente.getCPF()%></td>
				<td><%=cliente.getRG()%></td>
				<td><%=cliente.getEmail()%></td>
				<td style="text-align: center"><img class="image"
					src="./img/miniDetail.gif"
					onclick="detail('<%=cliente.getIdCliente()%>');" /> <img
					class="image" src="./img/miniRemove.gif"
					onclick="removeList('<%=cliente.getIdCliente()%>');" /></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>