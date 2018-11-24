<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Erro</title>
</head>
<body>
	Ocorreu um erro:<br>
<%
	Exception e =  (Exception) request.getAttribute("exception");
	e.printStackTrace();
%>
	<span style="color:red">
<%=e.getLocalizedMessage() %>
<%=e.getStackTrace() %>
<%=e.getCause() %>
<%=e.getSuppressed() %><br>
		<input type="button" class="button" value="Voltar" onclick="history.back();">
	</span>
</body>
</html>