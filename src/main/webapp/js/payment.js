/**
 * 
 */
 var time = 120;
 
 setInterval(changeTime,1000)
 
 function changeTime(){
 	var timer = document.getElementById('timer-component');
 	var min = Math.floor(time/60);
 	var sec = time%60;
 	sec = sec < 10 ? '0'+sec : sec;
 	timer.innerHTML = min +':'+ sec;
 	time--;
 	if(time==0){
 		var userName = document.getElementById('user-name').textContent;
 		var ajax = new XMLHttpRequest();
 		ajax.onreadystatechange = function(){
 			if(this.readyState == 4 && this.status == 200){
 				window.location = 'home';	
 			}
 		}
 		ajax.open('POST','paymentTimeout',true);
 		ajax.setRequestHeader('content-type','application/JSON');
 		ajax.send(JSON.stringify(userName));
 	}
 }
 
 function makePayment(){
 	var ajax = new XMLHttpRequest();
 	var userName = document.getElementById('user-name').textContent;
 	var bankName = document.getElementById('bank-name-input').value;
 	var accountNumber = document.getElementById('account-number-input').value;
 	var params = {
 		'bankName' : bankName,
 		'accountNumber' : accountNumber,
 		'userName' : userName,
 		'paymentMode' : 'Net Banking'
 	};
 	ajax.onreadystatechange = function(){
 		if(this.readyState == 4 && this.status ==200){
 			alert('success');
 		}
 	}
 	ajax.open('POST','/makePayment',true);
 	ajax.setRequestHeader('POST','/paymentTimeout',true);
 	ajax.send(JSON.stringify(params));
 }