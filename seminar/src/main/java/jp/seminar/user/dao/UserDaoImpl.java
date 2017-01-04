package jp.seminar.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.count");
	}

}
