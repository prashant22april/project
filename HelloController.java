package com.abc.controller;

import java.util.Random;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String printHello(ModelMap model) {

		model.addAttribute("message", "Mail sent Successfully!");

		/*
		 * ApplicationContext context = new
		 * ClassPathXmlApplicationContext("Spring-Mail.xml");
		 * 
		 * MailCode mm = (MailCode) context.getBean("mailMail");
		 * 
		 * mm.sendMail("from@no-spam.com", "to@no-spam.com", "Testing123",
		 * "Testing only \n\n Hello Spring Email Sender");
		 */

		return "hello";
	}

	@RequestMapping("/")
	public String helloAjax(ModelMap model) {
		model.addAttribute("message", "Spring MVC with Ajax and JQuery Demo..");
		return "ajax";
	}

	@RequestMapping(value = "/ajaxcaptcha", method = RequestMethod.GET)
	public @ResponseBody String getCaptcha() {

		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 5) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;
	}

}