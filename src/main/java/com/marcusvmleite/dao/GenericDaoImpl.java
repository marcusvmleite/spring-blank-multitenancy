package com.marcusvmleite.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericDaoImpl<T extends Serializable> implements GenericDao<T> {

	@Autowired
	protected SessionFactory sessionFactory;
	
	protected Class<T> domainClass;
	
	@SuppressWarnings("unchecked")
	private Class<T> getDomainClass() {
		if (domainClass == null) {
			ParameterizedType thisType = (ParameterizedType) getClass()
					.getGenericSuperclass();
			this.domainClass = (Class<T>) thisType.getActualTypeArguments()[0];
		}
		return domainClass;
	}

	protected String getDomainClassName() {
		return getDomainClass().getName();
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	protected Criteria createCriteria(Class<T> clazz) {
		return getSession().createCriteria(clazz);
	}
	
	protected Criteria createCriteria(Class<T> clazz, String alias) {
		return getSession().createCriteria(clazz, alias);
	}
	
	@Override
	public void create(T t) {
		getSession().save(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(Serializable id) {
		return (T) getSession().get(getDomainClass(), id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T load(Serializable id) {
		return (T) getSession().load(getDomainClass(), id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll() {
		return getSession()	.createQuery("from " + getDomainClassName()).list();
	}

	@Override
	public void update(T t) {
		getSession().update(t);
	}

	@Override
	public void delete(T t) {
		getSession().delete(t);
	}

	@Override
	public void deleteById(Serializable id) {
		delete(load(id));
	}

	@Override
	public void deleteAll() {
		getSession().createQuery("delete " + getDomainClassName()).executeUpdate();
	}

	

	

}
