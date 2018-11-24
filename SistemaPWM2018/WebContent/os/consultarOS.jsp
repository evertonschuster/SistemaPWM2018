<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Veiculo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Servico" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Funcionario" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.OS" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionOS" %>
<%
	OS osFilter = (OS) request.getSession().getAttribute("filterOS");
	if (osFilter == null) {
		osFilter = new OS();
	}
	
	Object list[] = (Object[]) request.getAttribute("list");
	if (list == null) {
		list = new Object[0];
	}
	
	Object listVeiculo[] = (Object[]) request.getAttribute("listVeiculo");
	if (listVeiculo == null) {
		listVeiculo = new Object[0];
	}	
	
	Object listServico[] = (Object[]) request.getAttribute("listServico");
	if (listServico == null) {
		listServico = new Object[0];
	}	
	
	Object listFuncionario[] = (Object[]) request.getAttribute("listFuncionario");
	if (listFuncionario == null) {
		listFuncionario = new Object[0];
	}	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar OS</title>
	<script type="text/javascript" src="./scripts/os.js"></script>	
</head>
<body>
	<div class="titulo">Consultar OS</div>
	<div class="divFields">
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="OS"/>	
			<div>		
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(osFilter.getIdOS() == null) ? "" : osFilter.getIdOS() %>" class="inputText" type="text" id="idOS" name="idOS"/></div>
			</div>

			<div>
				<div class="divLabel">Veiculo:</div>
				<div class="divField">
					<select class="listBox" name="veiculo" id="veiculo" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listVeiculo.length; i++) {
 		Veiculo veiculo = (Veiculo) listVeiculo[i];
 		Boolean bSelected = false;
 		if ((osFilter != null) && 
 			(osFilter.getVeiculo() != null) &&
 			(veiculo.getIdVeiculo() == osFilter.getVeiculo().getIdVeiculo())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=veiculo.getIdVeiculo() %>"><%=veiculo.getNome() %></option> 
<%
	}
%>
				</select>
			</div>
			
			<div>
				<div class="divLabel">Servico:</div>
				<div class="divField">
					<select class="listBox" name="servico" id="servico" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listServico.length; i++) {
 		Servico servico = (Servico) listServico[i];
 		Boolean bSelected = false;
 		if ((osFilter != null) && 
 			(osFilter.getServico() != null) &&
 			(servico.getIdServico() == osFilter.getServico().getIdServico())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=servico.getIdServico() %>"><%=servico.getDescricao() %></option> 
<%
	}
%>
				</select>
			</div>
			
			<div>
				<div class="divLabel">Funcionario:</div>
				<div class="divField">
					<select class="listBox" name="funcionario" id="funcionario" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listFuncionario.length; i++) {
 		Funcionario funcionario = (Funcionario) listFuncionario[i];
 		Boolean bSelected = false;
 		if ((osFilter != null) && 
 			(osFilter.getFuncionario() != null) &&
 			(funcionario.getIdFuncionario() == osFilter.getFuncionario().getIdFuncionario())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=funcionario.getIdFuncionario() %>"><%=funcionario.getNome() %></option> 
<%
	}
%>
				</select>
			</div>
			
			<div>
				<div class="divLabel">Quantidade:</div>
				<div class="divField"><input value="<%=(osFilter.getQuantidade() == null) ? "" : osFilter.getQuantidade() %>" class="inputText" type="text" id="Quantidade" name="Quantidade" style="width:320px;" /></div>
			</div>
			
			<div>
				<div class="divLabel">Valor:</div>
				<div class="divField"><input value="<%=(osFilter.getValor() == null) ? "" : osFilter.getValor() %>" class="inputText" type="text" id="Valor" name="Valor" style="width:320px;" /></div>
			</div>
	
			<div>
				<div class="divLabel">Data:</div>
				<div class="divField"><input value="<%=(osFilter.getData() == null) ? "" : osFilter.getData() %>" class="inputText" type="text" id="Data" name="Data" style="width:320px;" /></div>
			</div>
			
			<div>
				<div class="divLabel">Valor Total:</div>
				<div class="divField"><input value="<%=(osFilter.getValorTotal() == null) ? "" : osFilter.getValorTotal() %>" class="inputText" type="text" id="ValorTotal" name="ValorTotal" style="width:320px;" /></div>
			</div>
			
			<div>
				<div class="divLabel">Status:</div>
				<div class="divField"><input value="<%=(osFilter.getStatus() == null) ? "" : osFilter.getStatus() %>" class="inputText" type="text" id="Status" name="Status" style="width:320px;" /></div>
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
				<th>Veiculo</th>
				<th>Servico</th>
				<th>Funcionario</th>
				<th>Quantidade</th>
				<th>Valor</th>
				<th>Data</th>
				<th>Valor Total</th>
				<th>status</th>
				
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
 	for(int i=0; i<list.length; i++) {
 		OS os = (OS) list[i];
%>
			<tr>
				<td><%=os.getIdOS() %></td>
				<td><%=os.getVeiculo().getNome() %></td>
				<td><%=os.getServico().getDescricao() %></td>
				<td><%=os.getFuncionario().getNome() %></td>
				<td><%=os.getQuantidade().toString() %></td>
				<td><%=os.getValor().toString() %></td>
				<td><%=os.getData().toString() %></td>
				<td><%=os.getValorTotal().toString() %></td>
				<td><%=os.getStatus() %></td>
				<td style="text-align:center">
					<img class="image" src="./img/miniDetail.gif" onclick="detail('<%=os.getIdOS() %>');" />
					<img class="image" src="./img/miniRemove.gif" onclick="removeList('<%=os.getIdOS() %>');" />
				</td>
			</tr>
<%
	}
%>
		</table>
	</div>
</body>
</html>