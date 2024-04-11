package blogbuddy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import blogbuddy.entity.User;

@Component
public class UserDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createUser(User user) {
		this.hibernateTemplate.saveOrUpdate(user);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
