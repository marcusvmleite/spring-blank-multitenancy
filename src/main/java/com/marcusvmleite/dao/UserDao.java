package com.marcusvmleite.dao;

import com.marcusvmleite.model.User;

public interface UserDao extends GenericDao<User> {

	User findByUsername(String username);

}
