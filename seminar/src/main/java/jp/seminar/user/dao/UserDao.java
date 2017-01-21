package jp.seminar.user.dao;

import jp.seminar.user.model.UserVO;

public interface UserDao {
	int count();

	UserVO getUserByID(String username);
}
