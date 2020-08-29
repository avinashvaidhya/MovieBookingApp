package com.moviebookingfornt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import dataModel.SelectedSeatDetails;
import dataModel.TheatreDetails;

@Controller
public class HomeController {
	
	@Autowired
	RestTemplate restTemplate;

	@RequestMapping(value = "/home/{userName}")
	public ModelAndView home(@PathVariable("userName")String userName) {
		ModelAndView model = new ModelAndView();
		model.addObject("userName", userName);
		model.setViewName("Home");
		return model;
	}

	@RequestMapping(method = RequestMethod.GET,value = "/getSeats")
	@ResponseBody
	public Map<String,List<TheatreDetails>> getSeatsForTheatre(@RequestParam("theatreName") String theatreName) {
		Map<String,String> params = new HashMap<>();
		params.put("theatreName", theatreName);
		ResponseEntity<List> outputResponse = restTemplate.getForEntity("http://localhost:8081/getSeatDetails/{theatreName}",
				List.class,params);
		Map<String,List<TheatreDetails>> output = new HashMap<>();
		output.put("seatDetails", outputResponse.getBody());
		return output;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/preCheckout")
	@ResponseBody
	public Map<String,String> checkBeforePayment(@RequestBody SelectedSeatDetails selectedSeatDetails) {
		Map<String,String> result = new HashMap<String,String>();
		ResponseEntity<String> outputResponse = restTemplate.postForEntity("http://localhost:8081/checkSeatAvailability",
				selectedSeatDetails, String.class);
		if(outputResponse.getBody().equals("failure")) 
			result.put("failure", "Seats not available");
		else
			result.put("success", "The seats are available");
		return result;
	}
	
}
