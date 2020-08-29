/**
 * 
 */
 
 var selectedSeatList = [];
 
 function searchSeats(){
document.getElementById('proceed-payment-button').disabled = true;
 var theatreName = document.getElementById("theatre-name-input").value;
 document.getElementById("seat-detail-table").style.visibility = "hidden";
 selectedSeatList = [];
 var ajax = new XMLHttpRequest();
 	ajax.onreadystatechange = function(){
 		if(this.readyState == 4 && this.status == 200){
 			var responseMap = JSON.parse(this.responseText);
 			var seats = responseMap['seatDetails'];
 			var j = 0;
 			var seatTable = document.getElementById("seat-detail-table");
 			seatTable.style.visibility = "visible";
			for(var i=0;i<seats.length;i++){
			var buttonID = "seat-"+seats[i].seatNumber;
				if(seats[i].status === "booked"){
					document.getElementById(buttonID).disabled = true;
				}
			document.getElementById(buttonID).style.backgroundColor = "";
 			}
 		}
 	}
 	ajax.open("GET","getSeats?theatreName="+theatreName,true);
 	ajax.send();
 }
 
 function proceedForPayment(){
 	alert(selectedSeatList);
 	var ajax = new XMLHttpRequest();
 	var theatreName = document.getElementById('theatre-name-input').value;
 	var userName = document.getElementById('user-name-hidden-input').value;
 	var params = {
 		'selectedSeatList' : selectedSeatList,
 		'theatreName' : theatreName,
 		'userName' : userName
 	}
 	ajax.onreadystatechange = function(){
 		if(this.readyState == 4 && this.status == 200){
 			var response = JSON.parse(this.responseText);
 			if(response['error'].length > 0){
 				alert(response['error']);
 				searchSeats();
 			}else{
 				window.location = "payment/" + userName;
 			}
 		}
 	}
 	ajax.open("POST","preCheckout",true);
 	ajax.setRequestHeader("content-type","application/JSON");
 	ajax.send(JSON.stringify(params));
 }
 
 function checkSeatAvailability(){
 var ajax = new XMLHttpRequest();
 	var theatreName = document.getElementById('theatre-name-input').value;
 	var userName = document.getElementById('user-name-hidden-input').value;
 	var params = {
 		'selectedSeatList' : selectedSeatList,
 		'theatreName' : theatreName,
 		'userName' : userName
 	}
 	ajax.onreadystatechange = function(){
 		if(this.readyState == 4 && this.status == 200){
 			var response = JSON.parse(this.responseText);
 			if(response['error'].length > 0){
 				alert(response['error']);
 				searchSeats();
 			}else{
 				alert(response['success']);
 				document.getElementById('proceed-payment-button').disabled = false;
 			}
 		}
 	}
 	ajax.open("POST","preCheckout",true);
 	ajax.setRequestHeader("content-type","application/JSON");
 	ajax.send(JSON.stringify(params));
 }
 
 function backToLoginPage(){
 var url = "../login";
 window.location= url;
 }
 
 
 function selectSeat(seatNumber){
 	if(selectedSeatList.length > 6){
 		alert('Cannot select more than 6 seats');
 	}else{
 		var button = document.getElementById("seat-" +seatNumber);
 		if(button.style.backgroundColor == ""){
 			selectedSeatList.push(seatNumber);
 			button.style.backgroundColor = "#167";
 		}else{
	 		button.style.backgroundColor = "";
 			for(var i =0 ; i<selectedSeatList.length;i++){
 				if(seatNumber == selectedSeatList[i]){
 					selectedSeatList.pop(i);
 					break;
 				}
 			}
 		}
 	}
 }
 