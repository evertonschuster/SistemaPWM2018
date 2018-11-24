<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Usuario" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionUsuario" %>
<% 

	Object login = request.getSession().getAttribute("login");
	if(login != null){
		RequestDispatcher pages = request.getRequestDispatcher("menu.jsp");
		pages.forward(request, response);
	}
	
	String mensagem = (String) request.getAttribute("msg");
	Usuario usuario = (Usuario) request.getAttribute("object");
	if (usuario == null) {
		usuario = new Usuario();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Consultar Usuario</title>
	<script type="text/javascript" src="./scripts/usuario.js"></script>	
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
	<div class="titulo">Login do Usuario</div>
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
			<input type="hidden" id="entityName" name="entityName" value="Usuario"/>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(usuario.getNome() == null) ? "" : usuario.getNome() %>" class="inputText" type="text" id="nome" name="nome" style="width:320px;" /></div>
			</div>
			<div>
				<div class="divLabel">Senha:</div>
				<div class="divField"><input value="<%=(usuario.getSenha() == null) ? "" : usuario.getSenha() %>" class="inputText" type="text" id="Senha" name="Senha" style="width:320px;" /></div>
			</div>
		 
		</form>
		<div class="divButtons">
			<input type="button" class="button" id="btx" value="Logar" onclick="login();" />
		</div>
	</div>
</body>
</html>