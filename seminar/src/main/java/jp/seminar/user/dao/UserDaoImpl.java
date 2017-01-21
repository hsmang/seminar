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
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.count");
	}

	@Override
	public UserVO getUserByID(String username) {
		return sqlSession.selectOne("user.getUserByID");
	}
}
