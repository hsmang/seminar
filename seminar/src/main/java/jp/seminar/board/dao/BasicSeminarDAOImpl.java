package jp.seminar.board.dao;

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


@Repository("boardDao")
public class BasicSeminarDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectList(FirstRowPageSize  firstRowpageSize) {
		return sqlSession.selectList("basicSeminar.selectList" , firstRowpageSize);
	}

	@Override
	public BoardVO selectDeatil(int board_idx) {
		return (BoardVO) sqlSession.selectOne("basicSeminar.selectDetail", board_idx);
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
	public List<Board_UserVO> selectUserList() {
		return sqlSession.selectList("basicSeminar.selectUserList");
	}

	@Override
	public int insertReply(ReplyVO reply) {
		return sqlSession.insert("reply.insertReply", reply);
	}
	
	@Override
	public int updateBoardCount(BoardVO board) {
		return sqlSession.insert("basicSeminar.updateBoardCount", board);
	}

	@Override
	public int insertBoardImage(BoardImageVO image) {
		return sqlSession.insert("boardImage.insertBoardImage", image);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("basicSeminar.getTotalCount");
	}

	@Override
	public Board_UserVO getCertainUser(int user_idx) {
		return sqlSession.selectOne("basicSeminar.selectCertainUser", user_idx);
	}

	@Override
	public List<ReplyVO> getReply(ReplyVO reply) {
		return sqlSession.selectList("reply.selectReply", reply);
	}

	@Override
	public int insertFileinfo(FileVO fileinfo) {
		return sqlSession.insert("file.insertFileinfo", fileinfo);
	}

	@Override
	public int getMaxBoard_idx() {
		return sqlSession.selectOne("basicSeminar.getMaxIdx");
	}

	@Override
	public List<FileVO> getFileList(int board_idx) {
		return sqlSession.selectList("file.selectFileList", board_idx);
	}

}
