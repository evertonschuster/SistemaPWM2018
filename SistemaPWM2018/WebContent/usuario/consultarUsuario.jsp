<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.udc.sistemas.pwm2018.entity.Usuario" %>
<%@ page import="br.edu.udc.sistemas.pwm2018.session.SessionUsuario" %>
<%
	Usuario usuarioFilter = (Usuario) request.getSession().getAttribute("filterUsuario");
	if (usuarioFilter == null) {
		usuarioFilter = new Usuario();
	}
	
	Object list[] = (Object[]) request.getAttribute("list");
	if (list == null) {
		list = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="./css/styles.css" />
	<title>Consultar Usuario</title>
	<script type="text/javascript" src="./scripts/usuario.js"></script>	
</head>
<body>
	<div class="titulo">Consultar Usuario</div>
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
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Usuario"/>	
			<div>		
				<div class="divLabel">Código:</div>
				<div class="divField"><input value="<%=(usuarioFilter.getIdUsuario() == null) ? "" : usuarioFilter.getIdUsuario() %>" class="inputText" type="text" id="idUsuario" name="idUsuario"/></div>
			</div>
			<div>
				<div class="divLabel">Nome:</div>
				<div class="divField"><input value="<%=(usuarioFilter.getNome() == null) ? "" : usuarioFilter.getNome() %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
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
				<th>Nome</th>
				<th>email</th>
				<th>perfil</th>
				<th>senha</th>
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
 	for(int i=0; i<list.length; i++) {
 		Usuario usuario = (Usuario) list[i];
%>
			<tr>
				<td><%=usuario.getIdUsuario() %></td>
				<td><%=usuario.getNome() %></td>
				<td><%=usuario.getEmail() %></td>
				<td><%=usuario.getPerfil() %></td>
				<td><%=usuario.getSenha() %></td>
				<td style="text-align:center">
					<img class="image" src="./img/miniDetail.gif" onclick="detail('<%=usuario.getIdUsuario() %>');" />
					<img class="image" src="./img/miniRemove.gif" onclick="removeList('<%=usuario.getIdUsuario() %>');" />
				</td>
			</tr>
<%
	}
%>
		</table>
	</div>
</body>
</html>