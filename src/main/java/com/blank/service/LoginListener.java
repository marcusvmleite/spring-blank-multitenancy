package com.blank.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.blank.dao.UsuarioDao;
import com.blank.model.Usuario;

@Component
public class LoginListener implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {

	@Autowired
	private UsuarioDao usuarioDao;
	
    @Override
    @Transactional
    public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
        UserDetails userDetails = (UserDetails) event.getAuthentication().getPrincipal();
        Usuario usuario = (Usuario) userDetails;
        usuario.setLastLogin(new Date());
        usuario.setAttempts(Integer.valueOf(0));
        usuario.setBloqueado(Boolean.FALSE);
        usuarioDao.update(usuario);
    }
    
}
