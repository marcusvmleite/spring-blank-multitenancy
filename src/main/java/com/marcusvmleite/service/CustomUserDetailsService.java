package com.marcusvmleite.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marcusvmleite.dao.UserDao;
import com.marcusvmleite.model.User;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomUserDetailsService.class);

	@Autowired
	private UserDao userDao;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			User domainUser = userDao.findByUsername(username);
			User user = new User(domainUser.getId(), domainUser.getUsername(), domainUser.getPassword(), 
					true, true, true, true, new ArrayList<GrantedAuthority>());
			return user;
		} catch (Exception e) {
			LOGGER.error("Error getting user.", e);
			throw new RuntimeException(e);
		}
	}

}
