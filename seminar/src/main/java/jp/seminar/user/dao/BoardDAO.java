package jp.seminar.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectDeatil(String queryId, Object params){
		return sqlSession.selectList(queryId,params);
	}
}
