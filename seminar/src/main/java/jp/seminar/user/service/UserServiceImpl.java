package jp.seminar.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.user.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao userDao;
	@Override
	public int count() {
		return userDao.count();
	}

}
