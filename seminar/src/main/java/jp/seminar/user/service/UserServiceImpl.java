package jp.seminar.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.user.dao.UserDao;
import jp.seminar.user.model.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao userDao;
	
	@Override
	public int count() {
		return userDao.count();
	}
	
	@Override
	public UserVO getUserByID(String username) {
		return userDao.getUserByID(username);
	}

}
