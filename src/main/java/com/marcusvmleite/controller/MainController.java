package com.marcusvmleite.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/index**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage(@ModelAttribute("modelAndView") ModelAndView modelAndView) {
		if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
			return new ModelAndView("redirect:/login");
		} else {
			modelAndView.setViewName("index");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "expire", required = false) String expire,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("message", "Invalid credentials.");
		}
		if (logout != null) {
			model.addObject("message", "Logged out.");
			
			if (!(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof AnonymousAuthenticationToken)) {
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		          if (auth != null) {    
		             new SecurityContextLogoutHandler().logout(request, response, auth);
		          }
		        SecurityContextHolder.getContext().setAuthentication(null);
			}
		}
		if (expire != null) {
			model.addObject("message", "Session expired.");
		}
		model.setViewName("login");

		if (SecurityContextHolder.getContext().getAuthentication() != null && 
				!"anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())
				&& error == null &&	logout == null && expire == null) {
			return new ModelAndView("redirect:/index");
		}
		
		return model;
	}

}
