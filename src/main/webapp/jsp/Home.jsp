<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<script type="text/javascript" src="/js/home.js"></script>
</head>
<body>
	<form>
		<table align="center">
			<tr>
				<td> Welcome User:<p id= "user-name-field" value="${userName}">${userName}</p></td>
			</tr>
			<tr>
				<td>Theatre name : <input type="text" id="theatre-name-input">
				</td>


				<td><input type="button" value="Search seats"
					id="search-button-input" onclick="searchSeats()"></td>
			</tr>

		</table>

		<table align="center" id="seat-detail-table"
			style="visibility: hidden;">

			<tr>
				<td><input type="button" value="Seat1" id="seat-1"
					onclick="selectSeat(1) "></td>
				<td><input type="button" value="Seat2" id="seat-2"
					onclick="selectSeat(2)"></td>
				<td><input type="button" value="Seat3" id="seat-3"
					onclick="selectSeat(3)"></td>
				<td><input type="button" value="Seat4" id="seat-4"
					onclick="selectSeat(4)"></td>
				<td><input type="button" value="Seat5" id="seat-5"
					onclick="selectSeat(5)"></td>
				<td><input type="button" value="Seat6" id="seat-6"
					onclick="selectSeat(6)"></td>
			</tr>


			<tr>
				<td><input type="button" value="Seat7" id="seat-7"
					onclick="selectSeat(7)"></td>
				<td><input type="button" value="Seat8" id="seat-8"
					onclick="selectSeat(8)"></td>
				<td><input type="button" value="Seat9" id="seat-9"
					onclick="selectSeat(9)"></td>
				<td><input type="button" value="Seat10" id="seat-10"
					onclick="selectSeat(10)"></td>
				<td><input type="button" value="Seat11" id="seat-11"
					onclick="selectSeat(11)"></td>
				<td><input type="button" value="Seat12" id="seat-12"
					onclick="selectSeat(12)"></td>
			</tr>

		</table>

		<table align="center">
			<tr>
				<td><input type="button" id="back-button" value="Back To Login"
					onclick="backToLoginPage()"></td>

				<td><input type="button" id="check-availability-button"
					value="check-seat-availability" onclick="checkSeatAvailability()">
				</td>

				<td><input type="button" id="proceed-payment-button"
					value="Proceed To Payment" onclick="proceedForPayment()"
					disabled="true"></td>
			</tr>
		</table>

	</form>
</body>
</html>