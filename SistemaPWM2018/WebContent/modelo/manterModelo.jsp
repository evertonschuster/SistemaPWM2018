<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Modelo" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionModelo" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Modelo modelo = (Modelo) request.getAttribute("object");
	if (modelo == null) {
		modelo = new Modelo();
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
	<div class="titulo">Manter Modelo</div>
	<div class="divFields">
		<form id="form" name="form" method="post" action="dispatcher">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Modelo"/>	
			<div>
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(modelo.getIdModelo() == null) ? "" : modelo.getIdModelo() %>" class="inputText" type="text" id="idModelo" name="idModelo" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField"><input value="<%=(modelo.getDescricao() == null) ? "" : modelo.getDescricao() %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
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
 		if ((modelo != null) && 
 			(modelo.getMarca() != null) &&
 			(marca.getIdMarca() == modelo.getMarca().getIdMarca())) {
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
			<input type="button" class="button" id="btx" value="Salvar" onclick="save();" />
			<input type="button" class="button" value="Limpar" onclick="goNew();" />
			<input type="button" class="button" value="Excluir" onclick="remove();" />
			<input type="button" class="button" value="Voltar" onclick="goFind();" />
		</div>
	</div>
</body>
