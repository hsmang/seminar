package jp.seminar.admin.dao;

import java.util.List;

import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.user.model.UserVO;

public interface AdminDao {
	int count();

	UserVO getUserByID(String username);
	
	int userJoinProc(UserVO user);
	int userLoginProc(UserVO user);
	UserVO getUserInfo(UserVO user);
	int userUpdateProc(UserVO user);
	int getTotalCount(String order);
	List<UserVO> getUserList(FirstRowPageSize firstRowpageSize, String order);
	int userRoleProc(UserVO user);
	int userStateProc(UserVO user);
}
