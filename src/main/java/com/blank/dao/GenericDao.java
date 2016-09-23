package com.blank.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public interface GenericDao<T extends Serializable> {

	void create(T t);
	T get(Serializable id);
	T load(Serializable id);
	List<T> getAll();
	void update(T t);
	void delete(T t);
	void deleteById(Serializable id);
	void deleteAll();
	Session getSession();
	
}