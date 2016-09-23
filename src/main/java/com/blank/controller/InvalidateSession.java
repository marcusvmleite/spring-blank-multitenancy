package com.blank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvalidateSession {
	
    /**
     * This url gets invoked when spring security invalidates session (ie timeout).
     * Specific content indicates ui layer that session has been invalidated and page should be redirected to logout. 
     */
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
