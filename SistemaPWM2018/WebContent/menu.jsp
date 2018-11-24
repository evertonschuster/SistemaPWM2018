<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<title>Sistema de Controle de Serviços - PWM 20172S</title>
	
	<script type="text/javascript">
		function execute(entityName,newAction) {
			document.getElementById("newAction").value = newAction;
			document.getElementById("entityName").value = entityName;
			document.getElementById("form").submit();
		}
		
		function executelogout(entityName,newAction) {
			execute(entityName,newAction);
			window.location.href = "http://localhost:8080/SistemaPWM2018/";
		}
		
	</script>
	
</head>
<body>
	<form id="form" name="form" method="post" action="dispatcher" target="main">
		<input type="hidden" id="newAction" name="newAction" />
		<input type="hidden" id="entityName" name="entityName" />
	</form> 
	<div class="divMainTitulo">
		Sistema de Controle de Serviços - PWM 20172S
		<div style="text-align: right;">
			<input type="button" class="button" id="btx" value="logout" onclick="javascript:executelogout('index','logout');" />
		</div>
	</div>
	<div class="divMenu">
		<div class="titulo">MENU</div>
		<div><a href="javascript:execute('Marca','goFind');">Marca</a></div>
		<div><a href="javascript:execute('Modelo','goFind');">Modelo</a></div>
		<div><a href="javascript:execute('Veiculo','goFind');">Veiculo</a></div>
		<div><a href="javascript:execute('Cliente','goFind');">Cliente</a></div>
		<div><a href="javascript:execute('Funcionario','goFind');">Funcionario</a></div>
		<div><a href="javascript:execute('Servico','goFind');">Servico</a></div>
		<div><a href="javascript:execute('Usuario','goFind');">Usuario</a></div>
		<div><a href="javascript:execute('OS','goFind');">OS</a></div>
		
	</div>
	<div class="divMain">
		<iframe class="iframeMain" name="main"></iframe>
	</div>
</body>
</html>