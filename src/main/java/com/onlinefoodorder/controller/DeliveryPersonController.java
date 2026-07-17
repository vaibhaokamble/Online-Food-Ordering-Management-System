package com.onlinefoodorder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.onlinefoodorder.dao.DeliveryPersonDao;
import com.onlinefoodorder.model.DeliveryPerson;

@Controller
public class DeliveryPersonController {
	
	@Autowired
	private DeliveryPersonDao deliveryPersonDao;
	
	@GetMapping("/deliverylogin")
	public String goToDeliveryLoginPage() {
		return "deliverylogin";
	}
	
	@GetMapping("/deliverydashboard")
	public String goToDeliveryDashboard() {
		return "deliverydashboard";
	}
	
	@GetMapping("/deliveryregister")
	public String goToDeliveryRegisterPage() {
		return "deliveryregister";
	}
	
	@PostMapping("/deliveryregister")
	public ModelAndView registerDeliveryPerson(@ModelAttribute DeliveryPerson deliveryPerson) {
		ModelAndView mv = new ModelAndView();
		if(this.deliveryPersonDao.save(deliveryPerson)!= null) {
			mv.addObject("status", deliveryPerson.getFirstname()+" Successfully Registered as DELIVERY PERSON");
			mv.setViewName("deliverylogin");
		}
		else {
			mv.addObject("status", deliveryPerson.getFirstname()+" Failed to Register as DELIVERY PERSON");
			mv.setViewName("deliveryregister");
		}
		
		return mv;
	}
	
	@PostMapping("/deliverylogin")
	public ModelAndView loginDeliveryPerson(HttpServletRequest request, @RequestParam("emailid") String emailId, @RequestParam("password") String password ) {
		ModelAndView mv = new ModelAndView();
		
		DeliveryPerson deliveryPerson = deliveryPersonDao.findByEmailidAndPassword(emailId, password);
		
		if(deliveryPerson != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", deliveryPerson);
			session.setAttribute("user-login","delivery");
			mv.addObject("status", deliveryPerson.getFirstname()+" Successfully Logged in as DELIVERY PERSON!");
			mv.setViewName("index");
		}
		else {
			mv.addObject("status","Failed to login as Delivery Person!");
			mv.setViewName("index");
		}
		
		return mv;
	}
}
