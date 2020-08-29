<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/js/payment.js"></script>
</head>
<body>


<form >
<table align="center">
<tr>
<td>
<p id="timer-component">2:00</p>
</td>
</tr>


<tr>
<td>
Payment by:<p id="user-name" value="${userName}"> ${userName}
</p>
</td>
</tr>

<tr>
<td>
Enter Bank: 
</td>
<td>
<input type="text" id="bank-name-input">
</td>
</tr>

<tr>
<td>
Account Number:
</td> 
<td>
<input type="text" id="account-number-input">
</td>
</tr>

<tr>
<td>
<input type="button" id="make-payment-button" value="Make Payment" onclick="makePayment()">
</td>
</tr>  

</table>
</form>
</body>
</html>