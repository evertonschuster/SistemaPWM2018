<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Cliente" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionCliente" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Cliente cliente = (Cliente) request.getAttribute("object");
	if (cliente == null) {
		cliente = new Cliente();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Cliente</title>
	<script type="text/javascript" src="./scripts/cliente.js"></script>	
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
	<div class="titulo">Manter Cliente</div>
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
			<input type="hidden" id="entityName" name="entityName" value="Cliente"/>	
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(cliente.getIdCliente() == null) ? "" : cliente.getIdCliente() %>" class="inputText" type="text" id="idCliente" name="idCliente" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(cliente.getNome() == null) ? "" : cliente.getNome() %>" class="inputText" type="text" id="Nome" name="Nome" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">CPF:</div>
				<div class="divField"><input value="<%=(cliente.getCPF() == null) ? "" : cliente.getCPF() %>" class="inputText" type="text" id="CPF" name="CPF" style="width:320px;" size="15"/></div>
			
			</div>
			<div>
				<div class="divLabel">RG:</div>
				<div class="divField"><input value="<%=(cliente.getRG() == null) ? "" : cliente.getRG() %>" class="inputText" type="text" id="RG" name="RG" style="width:320px;" size="15"/></div>
				
			</div>
			<div>
				<div class="divLabel">Email:</div>
				<div class="divField"><input value="<%=(cliente.getEmail() == null) ? "" : cliente.getEmail() %>" class="inputText" type="text" id="Email" name="Email" style="width:320px;"/></div>
				
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