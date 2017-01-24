package jp.seminar.user.dao;

import jp.seminar.user.model.UserVO;

public interface UserDao {
	int count();

	UserVO getUserByID(String username);
	
	int userJoinProc(UserVO user);
	int userLoginProc(UserVO user);
	UserVO getUserInfo(UserVO user);
}
