package jp.seminar.user.service;

import jp.seminar.user.model.UserVO;

public interface UserService {
	int count();

	UserVO getUserByID(String username);
	UserVO getUserInfo(UserVO user);
	
	int userJoinProc(UserVO user);
	int userLoginProc(UserVO user);
}
