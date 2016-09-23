package com.marcusvmleite.dao;

import java.util.List;

import com.marcusvmleite.model.Usuario;

public interface UsuarioDao extends GenericDao<Usuario> {

	Usuario findByUsername(String username);

	List<Usuario> getUsuarioPorNome(String term);

	Usuario getByIdPessoa(Integer id);

	Usuario getByUsername(Object userName);

	void updateSenha(Usuario usuario);

}
