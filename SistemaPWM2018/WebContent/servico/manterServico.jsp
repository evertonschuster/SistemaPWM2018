<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Servico" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionServico" %>
<% 
	String mensagem = (String) request.getAttribute("msg");
	Servico servico = (Servico) request.getAttribute("object");
	if (servico == null) {
		servico = new Servico();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Servico</title>
	<script type="text/javascript" src="./scripts/servico.js"></script>	
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
	<div class="titulo">Manter Servico</div>
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
			<input type="hidden" id="entityName" name="entityName" value="Servico"/>
			<div>	
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(servico.getIdServico() == null) ? "" : servico.getIdServico() %>" class="inputText" type="text" id="idServico" name="idServico" readOnly/></div>
			</div>
			<div>
				<div class="divLabel">Descrição:</div>
				<div class="divField"><input value="<%=(servico.getDescricao() == null) ? "" : servico.getDescricao() %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Valor:</div>
				<div class="divField"><input value="<%=(servico.getValor() == null) ? "" : servico.getValor() %>" class="inputText" type="text" id="Valor" name="Valor" style="width:320px;" /></div>
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