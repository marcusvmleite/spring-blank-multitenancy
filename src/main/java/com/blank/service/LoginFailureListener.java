package com.blank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.blank.dao.UsuarioDao;
import com.blank.model.Usuario;

@Component
public class LoginFailureListener implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> {

	@Autowired
	private UsuarioDao usuarioDao;
	
    @Override
    @Transactional
    public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {
    	Object userName = event.getAuthentication().getPrincipal();
    	Usuario usuario = usuarioDao.getByUsername(userName);
    	if (usuario.getAttempts() + 1 >= 10) {
    		usuario.setBloqueado(Boolean.TRUE);
    	}
    	usuario.setAttempts(usuario.getAttempts() + 1);
    	usuarioDao.update(usuario);
    }
    
}
