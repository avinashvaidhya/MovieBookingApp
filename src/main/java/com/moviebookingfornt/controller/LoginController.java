package com.moviebookingfornt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import dataModel.UserDetails;

@Controller
public class LoginController {
	
	@Autowired
	RestTemplate restTemplate;

	@RequestMapping("/login")
	public String login() {
		return "Login";
	}
	
	@RequestMapping("/navigateHome")
	public String navigateHome(@RequestBody UserDetails userDetails) {
		ResponseEntity<String> outputResponse = restTemplate.postForEntity("http://localhost:8081/checkUserDetails",
				userDetails, String.class);
		return outputResponse.getBody();
	}
	
	@RequestMapping("/register")
	public String register() {
		System.out.println("register method call");
		return "redirect:/registerUser";
	}
	
}

