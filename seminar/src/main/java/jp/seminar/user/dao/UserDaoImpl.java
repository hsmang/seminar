package jp.seminar.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.user.model.UserVO;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int count() {
		return sqlSession.selectOne("user.count");
	}

	@Override
	public UserVO getUserByID(String username) {
		return sqlSession.selectOne("user.getUserByID");
	}

	@Override
	public int userJoinProc(UserVO user) {
		int result = 0;
		try {
			sqlSession.insert("user.userJoinProc", user);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int userLoginProc(UserVO user) {
		int count = sqlSession.selectOne("user.userLoginProc", user);
		return count;
	}

	@Override
	public UserVO getUserInfo(UserVO user) {
		
		return sqlSession.selectOne("user.getUserInfoByEmail", user);
	}

	@Override
	public int userUpdateProc(UserVO user) {
		int result = 0;
		try {
			sqlSession.update("user.userUpdateProc", user);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int getTotalCount(String order) {
		int role = 0 ;
		switch(order){
		case "all" :
			role = 4;
			break;
		case "manager" :
			role = 2;
			break;
		}
		
		return sqlSession.selectOne("user.getTotalCount",role);
	}
}
