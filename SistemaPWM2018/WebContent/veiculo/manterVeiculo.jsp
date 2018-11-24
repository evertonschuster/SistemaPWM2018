<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Modelo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Veiculo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Cliente" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionVeiculo" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Veiculo veiculo = (Veiculo) request.getAttribute("object");
	if (veiculo == null) {
		veiculo = new Veiculo();
	}
	
	Object listModelo[] = (Object[]) request.getAttribute("listModelo");
	if (listModelo == null) {
		listModelo = new Object[0];
	}
	
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	if(listCliente == null){
		listCliente = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Veiculo</title>
	<script type="text/javascript" src="./scripts/veiculo.js"></script>	
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
	<div class="titulo">Manter Veiculo</div>
	<div class="divFields">
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Veiculo"/>	
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(veiculo.getIdVeiculo() == null) ? "" : veiculo.getIdVeiculo() %>" class="inputText" type="text" id="idVeiculo" name="idVeiculo" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(veiculo.getNome() == null) ? "" : veiculo.getNome() %>" class="inputText" type="text" id="Nome" name="Nome" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Placa:</div>
				<div class="divField"><input value="<%=(veiculo.getPlaca() == null) ? "" : veiculo.getPlaca() %>" class="inputText" type="text" id="Placa" name="Placa" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Chassis:</div>
				<div class="divField"><input value="<%=(veiculo.getChassis() == null) ? "" : veiculo.getChassis() %>" class="inputText" type="text" id="Chassis" name="Chassis" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Modelo:</div>
				<div class="divField">
					<select class="listBox" name="Modelo" id="Modelo" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listModelo.length; i++) {
		Modelo modelo = (Modelo) listModelo[i];
 		Boolean bSelected = false;
 		if ((veiculo != null) && 
 			(veiculo.getModelo() != null) &&
 			(modelo.getIdModelo() == veiculo.getModelo().getIdModelo())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=modelo.getIdModelo() %>"><%=modelo.getDescricao() %></option> 
<%
	}
%>
				</select>
			</div>
			<div>
				<div class="divLabel">Cliente:</div>
				<div class="divField">
					<select class="listBox" name="cliente" id="cliente" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente cliente = (Cliente) listCliente[i];
 		Boolean bSelected = false;
 		if ((veiculo != null) && 
 			(veiculo.getModelo() != null) &&
 			(cliente.getIdCliente() == veiculo.getCliente().getIdCliente())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=cliente.getIdCliente() %>"><%=cliente.getNome() %></option> 
<%
	}
%>
				</select>
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
