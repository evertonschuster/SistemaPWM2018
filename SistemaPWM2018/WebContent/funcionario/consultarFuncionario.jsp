<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Funcionario"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionFuncionario"%>
<%
	Funcionario funcionarioFilter = (Funcionario) request.getSession().getAttribute("filterFuncionario");
	if (funcionarioFilter == null) {
		funcionarioFilter = new Funcionario();
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
<link rel="stylesheet" type="text/css" href="./css/styles4.css" />
<title>Consultar Funcionario</title>
<script type="text/javascript" src="./scripts/funcionario.js"></script>
</head>
<body>
	<div class="titulo">Consultar Funcionario</div>
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
				id="entityName" name="entityName" value="Funcionario" />
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField">
					<input
						value="<%=(funcionarioFilter.getIdFuncionario() == null) ? "" : funcionarioFilter.getIdFuncionario()%>"
						class="inputText" type="text" id="idFuncionario" name="idFuncionario" />
				</div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField">
					<input
						value="<%=(funcionarioFilter.getNome() == null) ? "" : funcionarioFilter.getNome()%>"
						class="inputText" type="text" id="Nome" name="descricao"
						style="width: 320px;" />
				</div>
			</div>
			<div>
				<div class="divLabel">CPF:</div>
				<div class="divField">
					<input
						value="<%=(funcionarioFilter.getCPF() == null) ? "" : funcionarioFilter.getCPF()%>"
						class="inputText" type="text" id="CPF" name="descricao"
						style="width: 320px;" />
				</div>
			</div>
			<div>
				<div class="divLabel">RG:</div>
				<div class="divField">
					<input
						value="<%=(funcionarioFilter.getRG() == null) ? "" : funcionarioFilter.getRG()%>"
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
				<th>Salario</th>
				<th style="width: 50px;">&nbsp;</th>
			</tr>
			<%
				for (int i = 0; i < list.length; i++) {
					Funcionario funcionario = (Funcionario) list[i];
			%>
			<tr>
				<td><%=funcionario.getIdFuncionario()%></td>
				<td><%=funcionario.getNome()%></td>
				<td><%=funcionario.getCPF()%></td>
				<td><%=funcionario.getRG()%></td>
				<td><%=funcionario.getEmail()%></td>
				<td><%=funcionario.getSalario()%></td>
				<td style="text-align: center"><img class="image"
					src="./img/miniDetail.gif"
					onclick="detail('<%=funcionario.getIdFuncionario()%>');" /> <img
					class="image" src="./img/miniRemove.gif"
					onclick="removeList('<%=funcionario.getIdFuncionario()%>');" /></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>