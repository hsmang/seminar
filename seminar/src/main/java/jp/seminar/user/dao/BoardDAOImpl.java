package jp.seminar.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.board.BoardVO;
import jp.seminar.board.ReplyVO;


@Repository("boardDao")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectList() {
		return sqlSession.selectList("board.selectList");
	}

	@Override
	public List<Map<String, Object>> selectDeatil(int board_idx) {
		return sqlSession.selectList("board.selectDetail", board_idx);
	}

	@Override
	public int insertDetail(BoardVO board) {
		return sqlSession.insert("board.insertDetail", board);
	}

	@Override
	public int updateDetail(BoardVO board) {
		return sqlSession.update("board.updateDetail", board);
	}

	@Override
	public int deleteDetail(int board_idx) {
		return sqlSession.delete("board.deleteDetail", board_idx);
	}

	@Override
	public List<Map<String, Object>> selectUserList() {
		return sqlSession.selectList("board.selectUserList");
	}

	@Override
	public int insertReply(ReplyVO reply) {
		return sqlSession.insert("reply.insertReply", reply);
	}

	@Override
	public List<Map<String, Object>> getReply(ReplyVO reply) {
		return sqlSession.selectList("reply.selectReply", reply);
	}

}
