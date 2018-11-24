		
		function clean() {
			document.getElementById("newAction").value = "clean";
			document.getElementById("form").submit();
		}
	
		function detail(id) {
			document.getElementById("newAction").value = "detail";
			document.getElementById("id").value = id;
			document.getElementById("form").submit();
		}
	
		function removeList(id) {
			if (confirm("Confirma a Exclusão?")) {
				document.getElementById("newAction").value = "remove";
				document.getElementById("id").value = id;
				document.getElementById("form").submit();
			}
		}
		
		function find() {
			document.getElementById("newAction").value = "find";
			document.getElementById("form").submit();
		}
		
		function goNew() {
			document.getElementById("newAction").value = "goNew";
			document.getElementById("form").submit();;			
		}	
		
		function validate() {
			if (document.getElementById("Nome").value == "") {
				alert("Preencha a Nome!");
				document.getElementById("Nome").focus();
				return false;
			}
			return true;
		}
	
		function save() {
			if (validate()) {
				document.getElementById("newAction").value = "save";
				document.getElementById("form").submit();
			}
		}

		function remove() {
			if (confirm("Confirma a Exclusão?")) {
				document.getElementById("newAction").value = "remove";
				document.getElementById("form").submit();
			}
		}
		
		function goFind() {
			document.getElementById("newAction").value = "goFind";
			document.getElementById("form").submit();;			
		}