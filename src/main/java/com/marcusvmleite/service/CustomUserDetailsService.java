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

import com.marcusvmleite.dao.UsuarioDao;
import com.marcusvmleite.model.Usuario;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomUserDetailsService.class);

	@Autowired
	private UsuarioDao usuarioDao;
	
	/**
	 * Returns a populated {@link UserDetails} object. The username is first
	 * retrieved from the database and then mapped to a {@link UserDetails}
	 * object.
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			Usuario domainUser = usuarioDao.findByUsername(username);
			Usuario usuario = new Usuario(domainUser.getId(), domainUser.getUsername(), domainUser.getPassword(), 
					true, true, true, true, new ArrayList<GrantedAuthority>());
			return usuario;
		} catch (Exception e) {
			LOGGER.error("Error getting user.", e);
			throw new RuntimeException(e);
		}
	}

}
