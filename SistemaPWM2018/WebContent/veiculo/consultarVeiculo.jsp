<%@page import="com.sun.security.ntlm.Client"%>
<%@page import="br.edu.udc.sistemas.pwm2018.entity.Modelo"%>
<%@page import="br.edu.udc.sistemas.pwm2018.entity.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Veiculo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionVeiculo" %>
<%
	Veiculo veiculoFilter = (Veiculo) request.getSession().getAttribute("filterVeiculo");
	if (veiculoFilter == null) {
		veiculoFilter = new Veiculo();
	}
	
	Object list[] = (Object[]) request.getAttribute("list");
	if (list == null) {
		list = new Object[0];
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
</head>
<body>
	<div class="titulo">Consultar Veiculo</div>
	<div class="divFields">
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Veiculo"/>	
			<div>		
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(veiculoFilter.getIdVeiculo() == null) ? "" : veiculoFilter.getIdVeiculo() %>" class="inputText" type="text" id="idVeiculo" name="idVeiculo"/></div>
			</div>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(veiculoFilter.getNome() == null) ? "" : veiculoFilter.getNome() %>" class="inputText" type="text" id="Nome" name="Nome" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Placas:</div>
				<div class="divField"><input value="<%=(veiculoFilter.getPlaca() == null) ? "" : veiculoFilter.getPlaca() %>" class="inputText" type="text" id="Placa" name="Placa" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Chassis:</div>
				<div class="divField"><input value="<%=(veiculoFilter.getChassis() == null) ? "" : veiculoFilter.getChassis() %>" class="inputText" type="text" id="Chassis" name="Chassis" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Modelo:</div>
				<div class="divField">
					<select class="listBox" name="marca" id="marca" style="width:324px;">
						<option value="">Selecione</option>
				
<%
	for(int i=0; i<listModelo.length; i++) {
		Modelo modelo = (Modelo) listModelo[i];
 		Boolean bSelected = false;
 		if ((veiculoFilter != null) && 
 			(veiculoFilter.getModelo() != null) &&
 			(modelo.getIdModelo() == veiculoFilter.getModelo().getIdModelo())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=modelo.getIdModelo() %>"><%=modelo.getDescricao() %></option> 
<%
	}
%>
				</select>
				</div>
			</div>
			
			<div>
				<div class="divLabel">Cliente:</div>
				<div class="divField">
					<select class="listBox" name="cliente" id="cliente" style="width:324px;">
						<option value="">Selecione</option>
						<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente cliente = (Cliente) listCliente[i];
 		Boolean bSelected = false;
 		if ((veiculoFilter != null) && 
 			(veiculoFilter.getModelo() != null) &&
 			(cliente.getIdCliente() == veiculoFilter.getCliente().getIdCliente())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=cliente.getIdCliente() %>"><%=cliente.getNome() %></option> 
<%
	}
%>
				</select>
				</div>
			</div>
		</form>
		<div class="divButtons">
			<input type="button" class="button" id="btx" value="Consultar" onclick="find();" />
			<input type="button" class="button" value="Limpar" onclick="clean();" />
			<input type="button" class="button" value="Novo" onclick="goNew();" />
		</div>
	</div>
	<div class="divTable">
		<table class="table" cellpadding="0" cellspacing="0">
			<tr>
				<th style="width:50px;">Código</th>
				<th>Descrição</th>
				<th>Placa</th>
				<th>Chassis</th>
				<th>Modelo</th>
				<th>Cliente</th>
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
 	for(int i=0; i<list.length; i++) {
 		Veiculo veiculo = (Veiculo) list[i];
%>
			<tr>
				<td><%=veiculo.getIdVeiculo() %></td>
				<td><%=veiculo.getNome() %></td>
				<td><%=veiculo.getPlaca() %></td>
				<td><%=veiculo.getChassis() %></td>
				<td><%=veiculo.getModelo().getDescricao() %></td>
				<td><%=veiculo.getCliente().getNome() %></td>
				<td style="text-align:center">
					<img class="image" src="./img/miniDetail.gif" onclick="detail('<%=veiculo.getIdVeiculo() %>');" />
					<img class="image" src="./img/miniRemove.gif" onclick="removeList('<%=veiculo.getIdVeiculo() %>');" />
				</td>
			</tr>
<%
	}
%>
		</table>
	</div>
</body>
</html>
