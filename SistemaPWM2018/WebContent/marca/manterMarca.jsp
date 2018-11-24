<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionMarca" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Marca marca = (Marca) request.getAttribute("object");
	if (marca == null) {
		marca = new Marca();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Marca</title>
	<script type="text/javascript" src="./scripts/marca.js"></script>	
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
	<div class="titulo">Manter Marca</div>
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
			<input type="hidden" id="entityName" name="entityName" value="Marca"/>
			<div>	
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(marca.getIdMarca() == null) ? "" : marca.getIdMarca() %>" class="inputText" type="text" id="idMarca" name="idMarca" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField"><input value="<%=(marca.getDescricao() == null) ? "" : marca.getDescricao() %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
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