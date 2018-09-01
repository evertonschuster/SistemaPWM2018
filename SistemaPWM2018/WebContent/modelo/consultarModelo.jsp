<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.poo2.entity.Modelo" %>
<%@ page import="br.edu.udc.sistemas.poo2.session.SessionModelo" %>
<%@ page import="br.edu.udc.sistemas.poo2.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.poo2.session.SessionMarca" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/styles.css">
	<title>Consultar Modelo</title>
	<script type="text/javascript" src="../scripts/modelo.js"></script>
</head>
<%
	Modelo modelo = new Modelo();
	Marca marca = new Marca();
	Object listModelo[] = new Object[0];
	String action = request.getParameter("newAction");
	if (action != null) {
		try {
			modelo.setId(Integer.parseInt(request.getParameter("idModelo")));
		} catch(Exception e) { 
		}
		modelo.setDescricao(request.getParameter("descricao"));
		SessionModelo sessionModelo = new SessionModelo();
		if (action.equals("find")) {
			listModelo = sessionModelo.find(modelo);
		} else if (action.equals("removeList")) {
			Modelo modeloRemove = new Modelo();
			try {
				modeloRemove.setId(Integer.parseInt(request.getParameter("id")));
			} catch(Exception e) { 
			}
			
			sessionModelo.remove(modeloRemove);
			listModelo = sessionModelo.find(modelo);
		}
	}

%>
<body>
	<div class="titulo">Consultar Modelo</div>
	<div class="divFields">
		<!-- 
			Formulário é um elemento não visual que engloba os inputs passivos
			de serem enviados ao servidor.
			Para input, select ou text-area ser enviado ao servidor ele deve:
			- Estar dentro do form que for executar o submit
			- Possuir setada a propriedade name
			- Não estar DISABLED
		 -->
		<form id="form" name="form" method="post" action="">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Modelo"/>			
			
			<!-- Pesquisar -->
			<div class="divLabel">Código:</div>
			<div class="divField">
				<input value="<%=(modelo.getId() != null) ? modelo.getId() : "" %>" class="inputText" type="text" id="idModelo" name="idModelo"/>
			</div>
			<br>
			<div class="divLabel">Descrição:</div>
			<div class="divField">
				<input value="<%=(modelo.getDescricao() != null) ? modelo.getDescricao() : "" %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" />
			</div>
			<br>
			<div class="divLabel">Descrição Modelo:</div>
			<div class="divField">
				  <select name="modelo" id="modelo" >
				  	
				  	<option value="0" >Selecione</option>
				  	<%
						SessionMarca sessionMarca = new SessionMarca();
						Object listMarca[] = sessionMarca.find(null);
						
						for(int i=0; i<listMarca.length; i++) {
							Marca marcaAux = (Marca) listMarca[i];
				  	%>
				    	<option value="<%=marcaAux.getId().toString() %>" <% if(modelo.getMarca() != null && modelo.getMarca().getId() == marcaAux.getId()){%>
				    		selected="selected" <%
				    			}
				    		%>
				    	><%=marcaAux.getDescricao() %> </option>
				    	}
				    <%
						}
				    %>
				  </select>
			</div>
			
		</form>
		<div class="divButtons">
			<input type="button" class="button" value="Consultar" onclick="find();" />
			<input type="button" class="button" value="Limpar" onclick="cleanFind();" />
			<input type="button" class="button" value="Novo" onclick="goNew();" />
		</div>
	</div>
	
<!-- 	Grid -->
	<div class="divTable">
		<table class="table" cellpadding="0" cellspacing="0">
			<tr>
				<th style="width:50px;">Código</th>
				<th>Descrição</th>
				<th>Modelo</th>
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
	for(int i=0; i<listModelo.length; i++) {
		Modelo modeloAux = (Modelo) listModelo[i];
%>
			<tr>
				<td><%=modeloAux.getId() %></td>
				<td><%=modeloAux.getDescricao() %></td>
				<td><%=modeloAux.getMarca().getDescricao() %></td>
				<td style="text-align:center">
					<img class="image" src="../img/miniDetail.gif" onclick="detail(<%=modeloAux.getId() %>);" />
					<img class="image" src="../img/miniRemove.gif" onclick="removeList(<%=modeloAux.getId() %>);" />
				</td>
			</tr>
<%	
	}
%>
		</table>
	</div>
</body>
</html>