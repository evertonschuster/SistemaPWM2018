<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Modelo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionModelo" %>
<%
	Modelo modeloFilter = (Modelo) request.getSession().getAttribute("filterModelo");
	if (modeloFilter == null) {
		modeloFilter = new Modelo();
	}
	
	Object list[] = (Object[]) request.getAttribute("list");
	if (list == null) {
		list = new Object[0];
	}
	
	Object listMarca[] = (Object[]) request.getAttribute("listMarca");
	if (listMarca == null) {
		listMarca = new Object[0];
	}	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Modelo</title>
	<script type="text/javascript" src="./scripts/modelo.js"></script>	
</head>
<body>
	<div class="titulo">Consultar Modelo</div>
	<div class="divFields">
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Modelo"/>	
			<div>		
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(modeloFilter.getIdModelo() == null) ? "" : modeloFilter.getIdModelo() %>" class="inputText" type="text" id="idModelo" name="idModelo"/></div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField"><input value="<%=(modeloFilter.getDescricao() == null) ? "" : modeloFilter.getDescricao() %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Marca:</div>
				<div class="divField">
					<select class="listBox" name="marca" id="marca" style="width:324px;">
						<option value="">Selecione</option>
			</div>
<%
	for(int i=0; i<listMarca.length; i++) {
 		Marca marca = (Marca) listMarca[i];
 		Boolean bSelected = false;
 		if ((modeloFilter != null) && 
 			(modeloFilter.getMarca() != null) &&
 			(marca.getIdMarca() == modeloFilter.getMarca().getIdMarca())) {
 			bSelected = true;
 		}
 %>					
					<option <%=(bSelected) ? "selected" : "" %> value="<%=marca.getIdMarca() %>"><%=marca.getDescricao() %></option> 
<%
	}
%>
				</select>
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
				<th>Marca</th>
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
 	for(int i=0; i<list.length; i++) {
 		Modelo modelo = (Modelo) list[i];
%>
			<tr>
				<td><%=modelo.getIdModelo() %></td>
				<td><%=modelo.getDescricao() %></td>
				<td><%=modelo.getMarca().getDescricao() %></td>
				<td style="text-align:center">
					<img class="image" src="./img/miniDetail.gif" onclick="detail('<%=modelo.getIdModelo() %>');" />
					<img class="image" src="./img/miniRemove.gif" onclick="removeList('<%=modelo.getIdModelo() %>');" />
				</td>
			</tr>
<%
	}
%>
		</table>
	</div>
</body>
</html>