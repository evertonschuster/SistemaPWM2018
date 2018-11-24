<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Funcionario" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionFuncionario" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Funcionario funcionario = (Funcionario) request.getAttribute("object");
	if (funcionario == null) {
		funcionario = new Funcionario();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles4.css">
	<title>Consultar Funcionario</title>
	<script type="text/javascript" src="./scripts/funcionario.js"></script>	
	<script type="text/javascript">
		function showMessage() {
<%
	if (mensagem != null) {
%>
			alert("<%=mensagem%>");
<%
	}
%>
		}	
	</script>	
</head>
<body onload="showMessage();">
	<div class="titulo">Manter Funcionario</div>
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
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Funcionario"/>	
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(funcionario.getIdFuncionario() == null) ? "" : funcionario.getIdFuncionario() %>" class="inputText" type="text" id="idFuncionario" name="idFuncionario" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(funcionario.getNome() == null) ? "" : funcionario.getNome() %>" class="inputText" type="text" id="Nome" name="Nome" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">CPF:</div>
				<div class="divField"><input value="<%=(funcionario.getCPF() == null) ? "" : funcionario.getCPF() %>" class="inputText" type="text" id="CPF" name="CPF" style="width:320px;" size="15"/></div>
			
			</div>
			<div>
				<div class="divLabel">RG:</div>
				<div class="divField"><input value="<%=(funcionario.getRG() == null) ? "" : funcionario.getRG() %>" class="inputText" type="text" id="RG" name="RG" style="width:320px;" size="15"/></div>
				
			</div>
			<div>
				<div class="divLabel">Email:</div>
				<div class="divField"><input value="<%=(funcionario.getEmail() == null) ? "" : funcionario.getEmail() %>" class="inputText" type="text" id="Email" name="Email" style="width:320px;"/></div>
				
			</div>
			<div>
				<div class="divLabel">Salario:</div>
				<div class="divField"><input value="<%=(funcionario.getSalario() == null) ? "" : funcionario.getSalario() %>" class="inputText" type="text" id="Salario" name="Salario" style="width:320px;"/></div>
				
			</div>
		</form>
		<div class="divButtons">
			<input type="button" class="button" id="btx" value="Salvar" onclick="save();" />
			<input type="button" class="button" value="Limpar" onclick="goNew();" />
			<input type="button" class="button" value="Excluir" onclick="remove();" />
			<input type="button" class="button" value="Voltar" onclick="goFind();" />
		</div>
	</div>
</body>
</html>