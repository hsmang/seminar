package jp.seminar.main.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;


@Repository("mainDao")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List selectList(FirstRowPageSize  firstRowpageSize) {
		List list = new ArrayList<>();
		list.add(sqlSession.selectOne("main.selectProduct" , firstRowpageSize));
		list.add(sqlSession.selectOne("main.selectBusinessContest" , firstRowpageSize));
		list.add(sqlSession.selectOne("main.selectAlbum" , firstRowpageSize));
		FirstRowPageSize  firstRowpageSize2 = new FirstRowPageSize(0, 2);
		list.add(sqlSession.selectList("main.selectSeminar" , firstRowpageSize2));
		list.add(sqlSession.selectList("main.selectAdmin" , firstRowpageSize2));
		list.add(sqlSession.selectList("main.selectStrategy" , firstRowpageSize2));
		list.add(sqlSession.selectList("main.selectSystem" , firstRowpageSize2));
		return  list;
	}
}
