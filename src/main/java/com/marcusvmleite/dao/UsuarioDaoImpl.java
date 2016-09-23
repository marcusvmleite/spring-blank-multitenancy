package com.marcusvmleite.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.marcusvmleite.model.Usuario;

@Repository
public class UsuarioDaoImpl extends GenericDaoImpl<Usuario> implements UsuarioDao {

	@Override
	public Usuario findByUsername(final String username) {
		Criteria criteria = createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("usuario", username));
		return (Usuario) criteria.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuarioPorNome(String term) {
		Query query = getSession().createQuery("SELECT a FROM Usuario a WHERE a.usuario LIKE :term ORDER BY a.usuario");
		query.setParameter("term", "%" + term + "%");
		return query.list();
	}

	@Override
	public Usuario getByIdPessoa(Integer id) {
		Query query = getSession().createQuery("SELECT a FROM Usuario a WHERE a.pessoa.id = :id");
		query.setParameter("id", id);
		return (Usuario) query.uniqueResult();
	}

	@Override
	public Usuario getByUsername(Object userName) {
		Query query = getSession().createQuery("SELECT a FROM Usuario a WHERE a.usuario = :userName");
		query.setParameter("userName", userName);
		return (Usuario) query.uniqueResult();
	}

	@Override
	public void updateSenha(Usuario usuario) {
		SQLQuery query = getSession().createSQLQuery("UPDATE public.usuario SET senha = :senha WHERE id = :id");
		query.setParameter("senha", usuario.getSenha());
		query.setParameter("id", usuario.getId());
		query.executeUpdate();
	}

}
