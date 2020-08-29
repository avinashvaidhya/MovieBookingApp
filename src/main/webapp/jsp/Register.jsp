<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration page</title>

<script type="text/javascript">
	function signUp() {
		// 	alert('asdasds');
		var ajax = new XMLHttpRequest();
		var userName = document.getElementById("user-name-input").value;
		var password = document.getElementById("password-input").value;
		var emailId = document.getElementById("email-id-input").value;
		var phoneNumber = document.getElementById("phone-number-input").value;

		var params = {
			'userName' : userName,
			'password' : password,
			'emailId' : emailId,
			'phoneNumber' : phoneNumber,
			'roleId' : 1
		};

		ajax.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var response = JSON.parse(this.responseText);
				if (response['errors'].length === 0) {
					alert("Account created")
				} else {
					alert(response['errors']);
				}
			}
		}
		ajax.open("POST", "signUp", true);
		ajax.setRequestHeader("content-type", "application/JSON");
		ajax.send(JSON.stringify(params));
	}

	function backToLogin() {
		window.location = "login";
	}
</script>

</head>
<body>
	<form>
		<table align="center">

			<tr>
				<td>User Name</td>
				<td><input id="user-name-input" type="text"></td>
			</tr>

			<tr>
				<td>Password</td>
				<td><input id="password-input" type="password"></td>
			</tr>

			<tr>
				<td>Email ID</td>
				<td><input id="email-id-input" type="text"></td>
			</tr>

			<tr>
				<td>Phone Number</td>
				<td><input id="phone-number-input" type="text"></td>
			</tr>

			<tr>
				<td><input type="button" value="Sign Up" onclick="signUp()">
				</td>
				<td><input type="button" value="Back to Login"
					onclick="backToLogin()"></td>
			</tr>

		</table>
	</form>

</body>
</html>