package jp.seminar.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.ReplyVO;


@Repository("boardDao")
public class BasicSeminarDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectList() {
		return sqlSession.selectList("basicSeminar.selectList");
	}

	@Override
	public List<Map<String, Object>> selectDeatil(int board_idx) {
		return sqlSession.selectList("basicSeminar.selectDetail", board_idx);
	}

	@Override
	public int insertDetail(BoardVO board) {
		return sqlSession.insert("basicSeminar.insertDetail", board);
	}

	@Override
	public int updateDetail(BoardVO board) {
		return sqlSession.update("basicSeminar.updateDetail", board);
	}

	@Override
	public int deleteDetail(int board_idx) {
		return sqlSession.delete("basicSeminar.deleteDetail", board_idx);
	}

	@Override
	public List<Map<String, Object>> selectUserList() {
		return sqlSession.selectList("basicSeminar.selectUserList");
	}

	@Override
	public int insertReply(ReplyVO reply) {
		return sqlSession.insert("reply.insertReply", reply);
	}

	@Override
	public List<Map<String, Object>> getReply(ReplyVO reply) {
		return sqlSession.selectList("reply.selectReply", reply);
	}

	public int updateBoardCount(BoardVO board) {
		return sqlSession.insert("basicSeminar.updateBoardCount", board);
	}

	@Override
	public int insertBoardImage(BoardImageVO image) {
		return sqlSession.insert("boardImage.insertBoardImage", image);
	}

}
