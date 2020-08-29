package com.moviebookingfornt.controller;

import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import dataModel.UserDetails;


@Controller
public class RegisterController {
	
	@Autowired
	RestTemplate restTemplate;

	@RequestMapping(value = "/registerUser")
	public String register() {
		return "Register";
	}
	
	@RequestMapping(value = "/signUp")
	@ResponseBody
	public Object signUp(@RequestBody UserDetails userDetails) {
		ResponseEntity<Object> outputResponse = restTemplate.postForEntity("http://localhost:8081/registerUser",
				userDetails, Object.class);
		return outputResponse.getBody();
	}
	
}
