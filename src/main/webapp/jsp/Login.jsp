<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<script type="text/javascript">
	function registerUser() {

		var ajax = new XMLHttpRequest();
		ajax.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				window.location = 'registerUser';
			}
		}
		// 		var url = "http://localhost:8080/register";
		var url = "register";
		ajax.open("POST", url, true);
		ajax.send();
	}

	function navigateHome() {
		var ajax = new XMLHttpRequest();
		var userName = document.getElementById("username-input").value;
		var password = document.getElementById("password-input").value;
		var params = {
				'userName' : userName,
				'password' : password
				};
		ajax.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var response = JSON.parse(this.responseText);
				if(response == 'success')
					window.location = 'home/'+userName;
				else
					alert('Invalid credentials/user credentials not found');
			}
		}
		var url = "navigateHome";
		ajax.open("POST",url,true);
		ajax.setRequestHeader("content-type","application/JSON");
		ajax.send(JSON.stringify(params));
	}
</script>
</head>
<body>
	<form>
		<table align="center">

			<tr>
				<td>User Name</td>
				<td><input type="text" id="username-input"></td>
			</tr>

			<tr>
				<td>Password</td>
				<td><input type="password" id="password-input"></td>
			</tr>

			<tr>
				<td><input type="button" value="Login" onClick="navigateHome()"></td>
				<td><input type="button" value="Register"
					onclick="registerUser()"></td>
			</tr>

		</table>
	</form>

</body>
</html>