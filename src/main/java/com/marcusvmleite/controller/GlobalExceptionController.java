package com.marcusvmleite.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionController {
	
	/**
	 * Logger da classe.
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionController.class);
	
	@ExceptionHandler(AccessDeniedException.class)
	public ModelAndView handleAllException(AccessDeniedException exception) {
		LOGGER.error("PERMISSÃO NEGADA!!!", exception);
		if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
			return new ModelAndView("redirect:/login?expire");
		}
		ModelAndView modelAndView = new ModelAndView("redirect:/403");
	    modelAndView.addObject("message", exception.getMessage());
	    return modelAndView;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception exception) {
		LOGGER.error("ERRO NO SISTEMA DETECTADO!!!", exception);
		if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
			return new ModelAndView("redirect:/login?expire");
		}
		ModelAndView modelAndView = new ModelAndView("redirect:/500");
	    modelAndView.addObject("message", exception.getMessage());
	    return modelAndView;
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handleError404(HttpServletRequest request, Exception exception)   {
		LOGGER.error("ERRO 404 NO SISTEMA DETECTADO!!!", exception);
		if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
			return new ModelAndView("redirect:/login?expire");
		}
		ModelAndView modelAndView = new ModelAndView("redirect:/404");
	    modelAndView.addObject("message", exception.getMessage());
	    return modelAndView;
    }
	
}