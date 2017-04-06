package jp.seminar.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.qna.model.QnaVO;
import jp.seminar.user.model.UserVO;

@Repository("qnaDao")
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCount(String order) {
		int role = 0 ;
		switch(order){
		case "all" :
			role = 3;
			break;
		case "not" :
			role = 0;
			break;
		case "done" :
			role = 1;
			break;
		}
		
		return sqlSession.selectOne("qna.getTotalCount",role);
	}

	@Override
	public List<QnaVO> getQnaList(FirstRowPageSize firstRowpageSize, String order) {
		int role = 0;
		switch(order){
		case "all" :
			role = 3;
			break;
		case "not" :
			role = 0;
			break;
		case "done" :
			role = 1;
			break;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("firstRow", firstRowpageSize.getFirstRow());
		map.put("pageSize", firstRowpageSize.getPageSize());
		map.put("role", role);
		return sqlSession.selectList("qna.getQnaList", map);
	}

	@Override
	public int qnaInsertProc(QnaVO qna) {
		return sqlSession.insert("qna.qnaInsertProc", qna);
	}

	@Override
	public int qnaUpdateProc(QnaVO qna) {
		return sqlSession.update("qna.qnaUpdateProc", qna);
	}

	@Override
	public QnaVO getQnaDetail(int qna_idx) {
		return sqlSession.selectOne("qna.qnaDetail",qna_idx);
	}
}
