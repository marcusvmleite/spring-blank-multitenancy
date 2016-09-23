package com.marcusvmleite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvalidateSession {
	
    @RequestMapping(value = "invalidate.do", method = RequestMethod.GET, headers = "X-Requested-With=XMLHttpRequest")
    @ResponseBody
    public String invalidateSessionAjax() {
        return "invalidSession";
    }
    
    @RequestMapping(value = "invalidate.do", method = RequestMethod.GET)
    public String invalidateSession() {
        return "redirect:/login?expire";
    }
    
}
