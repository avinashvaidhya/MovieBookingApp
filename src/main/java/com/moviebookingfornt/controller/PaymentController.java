package com.moviebookingfornt.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import dataModel.PaymentDetails;
import dataModel.SelectedSeatDetails;

@Controller
public class PaymentController {

	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(value = "/payment/{userName}")
	public ModelAndView paymentPage(@PathVariable("userName") String userName) {
		ModelAndView model = new ModelAndView();
		model.addObject("userName", userName);
		model.setViewName("Payment");
		return model;
	}
	
	@RequestMapping(value = "/paymentTimeout")
	public void paymentTimeout(@RequestBody String userName) {
		restTemplate.postForEntity("http://localhost:8081/duringPaymentTimeout", userName, Integer.class);
	}
	
	@RequestMapping(value = "/makePayment")
	@ResponseBody
	public String makePayment(@RequestBody PaymentDetails paymentDetails){
		ResponseEntity<String> outputResponse = restTemplate.postForEntity("http://localhost:8081/proceedToPayment",
					paymentDetails, String.class);
		return outputResponse.getBody();
	}
	
}
