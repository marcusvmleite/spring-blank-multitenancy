package com.marcusvmleite.dao.multitenant;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.context.spi.CurrentTenantIdentifierResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class WebSessionCurrentTenantIdentifierResolver implements CurrentTenantIdentifierResolver {

	private static final Logger LOGGER = LoggerFactory.getLogger(WebSessionCurrentTenantIdentifierResolver.class);

    @Autowired
    private HttpServletRequest request;

    @Override
    public String resolveCurrentTenantIdentifier() {
    	String tenantId = "";
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth != null && !(auth instanceof AnonymousAuthenticationToken) &&
    			request.getSession().getAttribute("schema") != null) {
			tenantId = (String) request.getSession().getAttribute("schema");
		}
        LOGGER.debug(MessageFormat.format("Found TenantId=\"{0}\"", tenantId));
        return tenantId;
    }

    @Override
    public boolean validateExistingCurrentSessions() {
        return true;
    }
    
}