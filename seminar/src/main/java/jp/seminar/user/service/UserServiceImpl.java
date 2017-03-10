package jp.seminar.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.paging.FirstRowPageSize;
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

	@Override
	public int userJoinProc(UserVO user) {
		return userDao.userJoinProc(user);
	}

	@Override
	public int userLoginProc(UserVO user) {
		int count = userDao.userLoginProc(user);
		if(count != 1){
			return 0;
		}else{
			return 1;
		}
		 
	}

	@Override
	public UserVO getUserInfo(UserVO user) {
		return userDao.getUserInfo(user);
	}

	@Override
	public int userUpdateProc(UserVO user) {
		int count = userDao.userUpdateProc(user);
		if(count != 1){
			return 0;
		}else{
			return 1;
		}
	}

	@Override
	public int getTotalCount(String order) {
		return userDao.getTotalCount(order);
	}

	@Override
	public List<UserVO> getUserList(FirstRowPageSize firstRowpageSize, String order) {
		return userDao.getUserList(firstRowpageSize, order);
	}

	@Override
	public int userRoleProc(UserVO user) {
		return userDao.userRoleProc(user);
	}

	@Override
	public int userStateProc(UserVO user) {
		return userDao.userStateProc(user);
	}

}
