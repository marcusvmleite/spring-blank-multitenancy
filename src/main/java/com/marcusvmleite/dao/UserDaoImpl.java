package com.marcusvmleite.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.marcusvmleite.model.User;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {

	/* (non-Javadoc)
	 * @see com.marcusvmleite.dao.UserDao#findByUsername(java.lang.String)
	 */
	@Override
	public User findByUsername(final String username) {
		Criteria criteria = createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		return (User) criteria.list().get(0);
	}

}
