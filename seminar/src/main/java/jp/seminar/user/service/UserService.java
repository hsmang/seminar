package jp.seminar.user.service;

import jp.seminar.user.model.UserVO;

public interface UserService {
	int count();

	UserVO getUserByID(String username);
}
